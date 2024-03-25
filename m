Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA1933997
	for <regressions@lists.linux.dev>; Mon, 25 Mar 2024 19:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.147.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711395703; cv=none; b=hmK5VmUMJoF12AP+JYyG2SH75d3QHjz4GdHHfiaTZY+XGrnmDtcAnHY0i58CufY02J6GicDwSqkWLXp8BoXzosJ5rP0EbATQ29BDnIkqDB6YiLj4PG73pgqGpVgiO4DkmDIaMwIZ0rK6Uo7S8QG0tINhEJU6kRdyFGKDSxhGilc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711395703; c=relaxed/simple;
	bh=EUp+UMeeB6aN+5adxNqSMTZOVLIznmtp/NgpGnt8gJs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IMYP30h8aGYP5+8rnAYO3f50aDdOS7jb0kZzzqHorFfM95E2RMmhuleSbA7Cthora/pgCyqpLy/pq5puStaAAEpwXcav1SU26nIIvfci5ukSA2t0rX6PZyWAgYhLUMRmH9rgwFJiC2AviV5nVlDs9qak+Lv5czElwVp2eBXJCqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=Xzm5vKOK; arc=none smtp.client-ip=148.163.147.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="Xzm5vKOK"
Received: from pps.filterd (m0150241.ppops.net [127.0.0.1])
	by mx0a-002e3701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 42PIWvXv009035;
	Mon, 25 Mar 2024 19:41:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pps0720; bh=Vd0x2s1s8A1eG1ZZUcTHg8PDO3Hnu/HCp1lniIrhfVc=;
 b=Xzm5vKOKDGhfPyk3b6/O2bDDB5/86VsfF9KI8DpOIf+MiXcE7zzwD5sc8gKkt6m8AL4m
 BSvKksShMjoTOyZhVXrqmccNYyTmBD1UvN/Uw7cneP8AweuKbRdtKFCTRxDz8s16ASwq
 5HT6jTI5xImDMaggDY9LPBFJOOS+LR5ioEYSKXSnV0NlmcGAdJUx4+zGn+t0Q0d7VxS7
 jr5Fc9s/XWg1JHmoUZJqP7o8wfj5t1VN1UNae04aXieJLYTkl0d5MRbZx1kRW/FFJaSe
 TAdmKyeuQlBqW0T1bXvCgACU0VTqkPFvlDO/Apgxglgmfg3fgbiV++UZC+eDwM+OlUG6 3Q== 
Received: from p1lg14879.it.hpe.com ([16.230.97.200])
	by mx0a-002e3701.pphosted.com (PPS) with ESMTPS id 3x37pscaq3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Mar 2024 19:41:24 +0000
Received: from p1lg14886.dc01.its.hpecorp.net (unknown [10.119.18.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by p1lg14879.it.hpe.com (Postfix) with ESMTPS id 5005E130DB;
	Mon, 25 Mar 2024 19:41:23 +0000 (UTC)
Received: from swahl-home.5wahls.com (unknown [16.231.227.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by p1lg14886.dc01.its.hpecorp.net (Postfix) with ESMTPS id 90A2F802A5B;
	Mon, 25 Mar 2024 19:41:20 +0000 (UTC)
Date: Mon, 25 Mar 2024 14:41:18 -0500
From: Steve Wahl <steve.wahl@hpe.com>
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: Russ Anderson <rja@hpe.com>, Ingo Molnar <mingo@kernel.org>,
        Steve Wahl <steve.wahl@hpe.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Andy Lutomirski <luto@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org,
        Linux regressions mailing list <regressions@lists.linux.dev>,
        Pavin Joseph <me@pavinjoseph.com>, stable@vger.kernel.org,
        Eric Hagberg <ehagberg@gmail.com>, Simon Horman <horms@verge.net.au>,
        Dave Young <dyoung@redhat.com>, Sarah Brofeldt <srhb@dbc.dk>,
        Dimitri Sivanich <sivanich@hpe.com>
Subject: Re: [PATCH] x86/mm/ident_map: Use full gbpages in identity maps
 except on UV platform.
Message-ID: <ZgHTXvCQr6ycbVzp@swahl-home.5wahls.com>
References: <20240322162135.3984233-1-steve.wahl@hpe.com>
 <ZgABC1oQ9YJW6Bw3@gmail.com>
 <20240325020334.GA10309@hpe.com>
 <87o7b273p2.fsf@email.froward.int.ebiederm.org>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87o7b273p2.fsf@email.froward.int.ebiederm.org>
X-Proofpoint-ORIG-GUID: tZl88hOSGq0zIbXaZ64Wt72pbBs_sQRp
X-Proofpoint-GUID: tZl88hOSGq0zIbXaZ64Wt72pbBs_sQRp
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-25_16,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 priorityscore=1501 mlxscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2403210000 definitions=main-2403250118

On Mon, Mar 25, 2024 at 10:04:41AM -0500, Eric W. Biederman wrote:
> Russ Anderson <rja@hpe.com> writes:
> > Steve can certainly merge his two patches and resubmit, to replace the
> > reverted original patch.  He should be on in the morning to speak for
> > himself.
> 
> I am going to push back and suggest that this is perhaps a bug in the
> HPE UV systems firmware not setting up the cpus memory type range
> registers correctly.
> 
> Unless those systems are using new fangled cpus that don't have 16bit
> and 32bit support, and don't implement memory type range registers,
> I don't see how something that only affects HPE UV systems could be
> anything except an HPE UV specific bug.

Eric,

I took the time to communicate with others in the company who know
this stuff better than I do before replying on this.

One of the problems with using the MTRRs for this is that there are
simply not enough of them.  The MTRRs size/alignment requirements mean
that more than one entry would be required per reserved region, and we
need one reserved region per socket on systems that currently can go
up to 32 sockets.  (In case you would think to ask, the reserved
regions also cannot be made contiguous.)

So MTRRs will not work to keep speculation out of our reserved memory
regions.

Let me know if you need more information from us on this.

Thanks.

--> Steve Wahl
-- 
Steve Wahl, Hewlett Packard Enterprise
