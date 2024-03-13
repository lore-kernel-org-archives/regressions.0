Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C9EF14270
	for <regressions@lists.linux.dev>; Wed, 13 Mar 2024 16:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.143.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710346687; cv=none; b=kyJc89ZhAyWc/3LMV/ORDJ6LKawrPY3vMFqcCpuSTK+Uo7mg1sEKn6m0od4bh6lTeGtoF0CQ6PhoI0pRhUb/2zpbd8urofV28o9J5zYAO8yIQ/Pi0UkTOIkfiRhLUJNY/dVbRfn61droklA3RxpfMlnj3wp7iggNASGw42CaRq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710346687; c=relaxed/simple;
	bh=nB2zWSV/sE60tT3UM7/wuTSgWsYf7O9eVNgXMLhjifs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qg1xq1x6U+e2i6GVGi8qb4dWSYKu53xi0vdqwNwwOg0UHiIE9oK7LpG7zDXUKk6bpvjrgs/m8MxYtFeS/j9VQddgmva7KYn29RG6UhUrkwUu1NNkw/Qcw2NFKydegOdDwQHAkIU76t6FgNJBqWsoKUeGARzQGa5wVkQBX0pYC5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=HNTJ9pi2; arc=none smtp.client-ip=148.163.143.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="HNTJ9pi2"
Received: from pps.filterd (m0150244.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 42DG5MBA012685;
	Wed, 13 Mar 2024 16:17:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pps0720; bh=Xsi8q+VaB2T25+0c6zwdCgPFGMx6vJfVrHs5htsg2go=;
 b=HNTJ9pi2GPYrFTUJ8IEuaQZ5tE09MiI2LSvOgM7waFeq40gtblcJeuaz0tUqSdPgi0RB
 YqZXevU0WGY1NI2b2ddyJbV0mTi41ovupDQh1jOPH9oAQ9cgHIhBaIThC9rNtOdAB+V3
 YPmmQcSyvpYP+McFQ8ZbFH3xzX6VutHqak3dSGp1dBCgmq5HJCPrGw92bRFSGGy3kWO3
 abtOQw+cCnxOyb6nb+ZDLJBwJ1lPEdfpg/enhH+5OJvOnZ5PIYhs4e099ZPiflAgmMiI
 NICzUscFcW7v9+82UBW8G+RuRT3t3KjRDonwdUPh1TjBBv4KynsLz6x3ZKS7bDAT99BW gQ== 
Received: from p1lg14879.it.hpe.com ([16.230.97.200])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 3wu3eye7q7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Mar 2024 16:17:58 +0000
Received: from p1lg14886.dc01.its.hpecorp.net (unknown [10.119.18.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by p1lg14879.it.hpe.com (Postfix) with ESMTPS id 2DAA812E96;
	Wed, 13 Mar 2024 16:17:57 +0000 (UTC)
Received: from swahl-home.5wahls.com (unknown [16.231.227.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by p1lg14886.dc01.its.hpecorp.net (Postfix) with ESMTPS id 1383780B37E;
	Wed, 13 Mar 2024 16:17:54 +0000 (UTC)
Date: Wed, 13 Mar 2024 11:17:52 -0500
From: Steve Wahl <steve.wahl@hpe.com>
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: Steve Wahl <steve.wahl@hpe.com>, Pavin Joseph <me@pavinjoseph.com>,
        Simon Horman <horms@verge.net.au>, kexec@lists.infradead.org,
        Eric Hagberg <ehagberg@gmail.com>, dave.hansen@linux.intel.com,
        regressions@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [REGRESSION] kexec does firmware reboot in kernel v6.7.6
Message-ID: <ZfHRsL4XYrBQctdu@swahl-home.5wahls.com>
References: <CAJbxNHe3EJ88ABB1aZ8bYZq=a36F0TFST1Fqu4fkugvyU_fjhw@mail.gmail.com>
 <ZensTNC72DJeaYMo@swahl-home.5wahls.com>
 <CAJbxNHfPHpbzRwfuFw6j7SxR1OsgBH2VJFPnchBHTtRueJna4A@mail.gmail.com>
 <ZfBxIykq3LwPq34M@swahl-home.5wahls.com>
 <42e3e931-2883-4faf-8a15-2d7660120381@pavinjoseph.com>
 <ZfDQ3j6lOf9xgC04@swahl-home.5wahls.com>
 <87cyryxr6w.fsf@email.froward.int.ebiederm.org>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87cyryxr6w.fsf@email.froward.int.ebiederm.org>
X-Proofpoint-GUID: aDwqsdeVggXjpca4h7zRAxcuG-S6dYdf
X-Proofpoint-ORIG-GUID: aDwqsdeVggXjpca4h7zRAxcuG-S6dYdf
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-13_09,2024-03-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 mlxlogscore=999 clxscore=1015 spamscore=0 phishscore=0 suspectscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2403130123

On Wed, Mar 13, 2024 at 07:16:23AM -0500, Eric W. Biederman wrote:
> 
> Kexec happens on identity mapped page tables.
> 
> The files of interest are machine_kexec_64.c and relocate_kernel_64.S
> 
> I suspect either the building of the identity mappged page table in
> machine_kexec_prepare, or the switching to the page table in
> identity_mapped in relocate_kernel_64.S is where something goes wrong.
> 
> Probably in kernel_ident_mapping_init as that code is directly used
> to build the identity mapped page tables.
> 
> Hmm.
> 
> Your change is commit d794734c9bbf ("x86/mm/ident_map: Use gbpages only
> where full GB page should be mapped.")

Yeah, sorry, I accidentally used the stable cherry-pick commit id that
Pavin Joseph found with his bisect results.

> Given the simplicity of that change itself my guess is that somewhere in
> the first 1Gb there are pages that needed to be mapped like the idt at 0
> that are not getting mapped.

...

> It might be worth setting up early printk on some of these systems
> and seeing if the failure is in early boot up of the new kernel (that is
> using kexec supplied identity mapped pages) rather than in kexec per-se.
> 
> But that is just my guess at the moment.

Thanks for the input.  I was thinking in terms of running out of
memory somewhere because we're using more page table entries than we
used to.  But you've got me thinking that maybe some necessary region
is not explicitly requested to be placed in the identity map, but is
by luck included in the rounding errors when we use gbpages.

At any rate, since I am still unable to reproduce this for myself, I
am going to contact Pavin Joseph off-list and see if he's willing to
do a few debugging kernel steps for me and send me the results, to see
if I can get this figured out.  (I believe trimming the CC list and/or
going private is usually frowned upon for the LKML, but I think this
is appropriate as it only adds noise for the rest.  Let me know if I'm
wrong.)

Thank you.

--> Steve Wahl

-- 
Steve Wahl, Hewlett Packard Enterprise
