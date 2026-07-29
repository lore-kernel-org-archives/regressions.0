Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D55283CAF
	for <regressions@lists.linux.dev>; Wed, 29 Jul 2026 10:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785320253; cv=none; b=laJdcTTiFeVOWSKaEK7YpJBKdlwZHRXgQA2lcjfb8FSmGw7O8aRXP4KNIKfEQb3PKfGQOpb1wQToUIG80WCMs6Zh0Hm5H3xOx/UofpgkS2QyR3pBZ5eK9MrwWEJmH89u4nf728lLvhLxW8MKrXmSezKcqF0y+sz9vLuMBQFAyi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785320253; c=relaxed/simple;
	bh=W4f19jz/r+cFKn3QRm9z8nUis2Z3VkGlD7G3TaqagKg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pBHX7I6Esu/neAxKsJ3qyjbNQEFiFi65ZsDE+C3mR38YH34pltKL3CjxGnuVaLR576UvMIsspeJ+u1v1s9kv4ihHrvMvjPmaBAfj6peGPTnBf69aEIz60rxvlHYS5xH2H2uCgL8sg9YSCdZQTU0H6qt4Q2SsvArbJNoB7by+mKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=Ucg4pDkU; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="Ucg4pDkU"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T7mntm3508414;
	Wed, 29 Jul 2026 10:16:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=HqWHD7
	iB2RJSw+betsgj2zLmi6yCUWTQTezgrMsQtec=; b=Ucg4pDkUDEKYKXP3/uQUpG
	vCGR0EhG8ka8c7GpFzXhI6jTY8JtFHm/unjSCjBwinJLPqkeGsLXlyu4mSeiT1et
	ef43GPl8eqC2iSy+v+idUBkgIoKKD4oelhU5ZuM2hx5nUqKqr/letKTcdID7yvTw
	LyJ+W3EftMaDPZ+UgohM+bFBqYa0mqw2a4fVTwESoJJY7ZgxZBy9o5RFLGLlJNDV
	Cz1tUL4DvSYNEPntLshoV8wj63+nJA+6Irs9mpyNRgdmrpVu46ZNO2RX6JCzneNO
	vQX76nALddLBD3Tqd6UHxYnyMyJUUcYM5yCAsHTybodmg4cUZV4cqvWA4V/BQ/Qw
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4fmuyj9awh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Jul 2026 10:16:57 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 66T9uJMm027022;
	Wed, 29 Jul 2026 10:16:56 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4fn8yhe4g8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Jul 2026 10:16:56 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 66TAGtZB33817266
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 29 Jul 2026 10:16:55 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 40D8458043;
	Wed, 29 Jul 2026 10:16:55 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F1B9458053;
	Wed, 29 Jul 2026 10:16:47 +0000 (GMT)
Received: from [9.43.93.217] (unknown [9.43.93.217])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 29 Jul 2026 10:16:47 +0000 (GMT)
Message-ID: <8dda7a5a-96ed-4a80-a6db-c01434ae897c@linux.ibm.com>
Date: Wed, 29 Jul 2026 15:46:45 +0530
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc/970: fix nap return address corruption on async
 interrupt exit
To: Thorsten Leemhuis <regressions@leemhuis.info>, mpe@ellerman.id.au,
        npiggin@gmail.com
Cc: thuth@redhat.com, "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>,
        mchauras@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
        ruanjinjie@huawei.com, linux-kernel@vger.kernel.org,
        Andreas Schwab <schwab@linux-m68k.org>,
        John Ogness <john.ogness@linutronix.de>, chleroy@kernel.org,
        sshegde@linux.ibm.com,
        Linux kernel regressions list <regressions@lists.linux.dev>
References: <20260707172430.790040-1-mkchauras@gmail.com>
 <87fr1iq4fu.fsf@jogness.linutronix.de> <87h5lpq5x4.fsf@jogness.linutronix.de>
 <67fd0bdf-237e-41d0-aa02-62ca2736942a@leemhuis.info>
Content-Language: en-US
From: Madhavan Srinivasan <maddy@linux.ibm.com>
In-Reply-To: <67fd0bdf-237e-41d0-aa02-62ca2736942a@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA4MCBTYWx0ZWRfX1oWG6KpaOO4p
 HTDJO7VNOHX15N4Ucl0MdYqhhdcbrrz9IR+uJJnEj7ebSk+PXIn1hRe/jBZ1O3vDnJ4Ul7lw8y3
 nT0CDLnIXJ2tlzarDwJ5kCUwwMZqT3Q=
X-Proofpoint-GUID: 7Hboy94Y4Ck0oYSENYbI1NMCcQoGDA2m
X-Proofpoint-ORIG-GUID: lzw0ZbpeEKtXZ69xUbTD4D8wvA1zWI6h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA4MCBTYWx0ZWRfXzTi0LTZI7IWl
 SYZ9m15CPs90T6e0eCSN9NZ+gJZcxYe6SkU5bm9M/DWAc4orXYmz9yvJ+Li39WsblizBgk7hhxc
 IGPIpHwthTOmo5lkK+S57f05W/1WCtLx/zXim9a8vDOCaQFSdhS3SFq0F1TOzW33PY3pic50HXY
 W6Pb9gtWTBvXJStpq6iFSdho6KC5PDG9idylIZDz/HwrGpv7mDPaU30TmMdXQIzxJw+gg8bRdtF
 hYtpSd9347LheiALFTKBpp1ygd1kpRA8M9d6SqgeZXy33rxlERT82QG5+DfcFx6H9rztOP1yZwo
 AghhkL7LVxOtVxwopNqjb4oxGSDjWAYjq85IPCWYgIFs+TWueDwUz6F1qHHT/NN3P/jmjnPE1+y
 XJhPx5FtS4IRQTct/ASceUqdARbAF0fuop0FcTbcsrlj9hwZJKGISJyncIxTN3f0jajv3UbiIQ2
 L2DEzjuF/55O7ALQFtw==
X-Authority-Analysis: v=2.4 cv=X5Vi7mTe c=1 sm=1 tr=0 ts=6a69d319 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=tBb2bbeoAAAA:8 a=htZlTOaOdGbwrN_0Y0cA:9 a=QEXdDO2ut3YA:10
 a=Oj-tNtZlA1e06AYgeCfH:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_03,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290080


On 7/29/26 2:27 PM, Thorsten Leemhuis wrote:
> On 7/23/26 13:52, John Ogness wrote:
>> On 2026-07-16, John Ogness <john.ogness@linutronix.de> wrote:
>>> On 2026-07-07, "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com> wrote:
>>>> On PowerMac G5 (PPC970, CONFIG_PPC_970_NAP) the system panics shortly
>>>> after boot with symptoms including instruction fetch faults, kernel data
>>>> access faults, and stack corruption, predominantly on SMP and always
>>>> somewhere inside softirq processing.
>>>> [...]
>>>> Fix this by calling nap_adjust_return() inside DEFINE_INTERRUPT_HANDLER_ASYNC
>>>> immediately before irq_exit_rcu(), ensuring _TLF_NAPPING is cleared and
>>>> regs->NIP is adjusted before any code that can re-enable interrupts or
>>>> invoke softirqs runs.  Move the explanatory comment into
>>>> nap_adjust_return() itself and remove it from arch_interrupt_async_exit_prepare().
>>>>
>>>> Fixes: bee25f97ad24 ("powerpc: Enable GENERIC_ENTRY feature")
>>>> Closes: https://lore.kernel.org/all/87wlvazrdy.fsf@igel.home/
>>>> Reported-by: Andreas Schwab <schwab@linux-m68k.org>
>>>> Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
>>> Tested-by: John Ogness <john.ogness@linutronix.de>
>> Is there a reason this is not being queued for 7.2? Without this fix,
>> PPC970 machines cannot boot 7.2.
> Wondering the same. Quick reminder: Linus afaik wants all regressions
> ideally be fixed by -rc6. So it would be good to get this mainlined
> within the next few days -- unless of course there is a reason why this
> fix is a bad idea. Is there?
I have added this to my fixes-test and will pull this as part of 
upcoming fixes PR
Maddy
>
> Ciao, Thorsten
