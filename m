Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001237C0BC
	for <regressions@lists.linux.dev>; Tue, 12 Mar 2024 15:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.147.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710256441; cv=none; b=AgMUkB24qVfi+ZBRSbm/MPtDUQTzeUZ4Mtvv8gL+w05lLFYd6O9bJduKCKFLMhMSY/wqwUGOA2dU9f3N+g6vQsucwfjtxpMRy2d+KBAw+w3lChcFZpQtJHxteAOyG4wHrI09nC78Tk5j+6Zlr3SO8nGX/8IJC0DUSTXMw6SXSUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710256441; c=relaxed/simple;
	bh=io3S1saJDHatVTKspzYZfCLz6VHWgnRMeKhUuidbXlA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KNUjCxozCInziPJ9jSbJieRlwHlciwsa2d+52UxQgbJzd1zbgT1P0p9IVots8adkmN2xXli+0arIln1UUNj8DgIGIzVgGyv4EW6hVQReRtsq+YLI6FOhz/QHidELD56uXPtzE1dlD/GvXeMTuAt9zxwubBKN8xYdcVheLWWp/Ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=fXuYR4Hm; arc=none smtp.client-ip=148.163.147.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="fXuYR4Hm"
Received: from pps.filterd (m0134420.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 42C94qLP030590;
	Tue, 12 Mar 2024 15:13:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=pps0720;
 bh=ClVy54ThUDS1VBlUhwmJpGc6q3AqT+QkSvcuUTlVMGE=;
 b=fXuYR4HmCxfCgft29ownCoZo37WRUswS/a/Z72faMj/VUGxoFj61Ut/IpZ10/hdfCl+0
 +4OP4RYRcEpfC6BTCXJA7V9LwYczyEFdeRxDnf5gogYm4vKh+KywyuT7f+QOvgPgXgaf
 MUKW0HFWp993G916076LOD6M2LAbBc5PnOAlBE6WmIcQ7vQm6uMHV9s9xE65Fz6cUaPe
 S++0OKIJFdNpsB5Xi/ZHS7uxy5eU776Baw1fNRw9SJ50JzLTdMGRYp0yuXZvoIsjCzL0
 M6BBB3Nf52W2oydiAUqKwJ6dKzYcjrf0HzWwlE8RRpHbmaysHREt+QzW5csBftIUa4k/ og== 
Received: from p1lg14879.it.hpe.com ([16.230.97.200])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 3wtm3ru5a3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Mar 2024 15:13:52 +0000
Received: from p1lg14886.dc01.its.hpecorp.net (unknown [10.119.18.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by p1lg14879.it.hpe.com (Postfix) with ESMTPS id 40D4313047;
	Tue, 12 Mar 2024 15:13:42 +0000 (UTC)
Received: from swahl-home.5wahls.com (unknown [16.231.227.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by p1lg14886.dc01.its.hpecorp.net (Postfix) with ESMTPS id 1DCF680361B;
	Tue, 12 Mar 2024 15:13:41 +0000 (UTC)
Date: Tue, 12 Mar 2024 10:13:39 -0500
From: Steve Wahl <steve.wahl@hpe.com>
To: Eric Hagberg <ehagberg@gmail.com>
Cc: Steve Wahl <steve.wahl@hpe.com>, me@pavinjoseph.com,
        dave.hansen@linux.intel.com, regressions@lists.linux.dev,
        stable@vger.kernel.org
Subject: Re: [REGRESSION] kexec does firmware reboot in kernel v6.7.6
Message-ID: <ZfBxIykq3LwPq34M@swahl-home.5wahls.com>
References: <CAJbxNHe3EJ88ABB1aZ8bYZq=a36F0TFST1Fqu4fkugvyU_fjhw@mail.gmail.com>
 <ZensTNC72DJeaYMo@swahl-home.5wahls.com>
 <CAJbxNHfPHpbzRwfuFw6j7SxR1OsgBH2VJFPnchBHTtRueJna4A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJbxNHfPHpbzRwfuFw6j7SxR1OsgBH2VJFPnchBHTtRueJna4A@mail.gmail.com>
X-Proofpoint-ORIG-GUID: ctcJBFsFMrBnJBaKEsFOvvgdXOBViQx3
X-Proofpoint-GUID: ctcJBFsFMrBnJBaKEsFOvvgdXOBViQx3
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-12_10,2024-03-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 spamscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 suspectscore=0 phishscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2403120116

On Tue, Mar 12, 2024 at 07:04:10AM -0400, Eric Hagberg wrote:
> On Thu, Mar 7, 2024 at 11:33 AM Steve Wahl <steve.wahl@hpe.com> wrote:
> > What Linux Distribution are you running on that machine?  My guess
> > would be that this is not distro related; if you are running something
> > quite different from Pavin that would confirm this.
> 
> Distro in use is Rocky 8, so it’s pretty clear not to be distro-specific.
> 
> > I found an AMD based system to try to reproduce this on.
> 
> yeah, it probably requires either a specific cpu or set or devices plus cpu
> to trigger… found that it also affects Dell R7625 servers in addition to
> the R6615s

I agree that it's likely the CPU or particular set of surrounding
devices that trigger the problem.

I have not succeeded in reproducing the problem yet. I tried an AMD
based system lent to me, but it's probably the wrong generation (AMD
EPYC 7251) and I didn't see the problem.  I have a line on a system
that's more in line with the systems the bug was reported on that I
should be able to try tomorrow.

I would love to have some direction from the community at large on
this.  The fact that nogbpages on the command line causes the same
problem without my patch suggests it's not bad code directly in my
patch, but something in the way kexec reacts to the resulting identity
map.  One quick solution would be a kernel command line parameter to
select between the previous identity map creation behavior and the new
behavior.  E.g. in addition to "nogbpages", we could have
"somegbpages" and "allgbpages" -- or gbpages=[all, some, none] with
nogbpages a synonym for backwards compatibility.

But I don't want to introduce a new command line parameter if the
actual problem can be understood and fixed.  The question is how much
time do I have to persue a direct fix before some other action needs
to be taken?

Thanks,

--> Steve Wahl

-- 
Steve Wahl, Hewlett Packard Enterprise
