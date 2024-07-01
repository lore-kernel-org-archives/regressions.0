Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E85A14A098
	for <regressions@lists.linux.dev>; Mon,  1 Jul 2024 11:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719834877; cv=none; b=fCQE1UR6fkVYgZLB+xkw4FFgCvTmyFi+xRwm/mql4vz8C/NURd7e8MgWLlGgDiklbcZCgyj2Xd+TGh5AJNcoadiVAqRurmeZU1db3vdkvOi/x0ZNt7kPGf/IrZENJg2blpE3bNuZ0ief8FGPMdQMz19GsaoQz3c68d0jen8jWc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719834877; c=relaxed/simple;
	bh=mzIyDrfjJn4GAeJjASEHoad7oOdOGxyr40glDiHK6V4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dCN6B9sqL7KQrwnZVoIzVdhHdpMQIPWFWuBgDStK3kk+eDQ2rCJZW2xGH86H+6M9tUDWSGVEn+Tzxy1j/K4LBdvSnEkVCU53Po6k5bsRKekUiPlpnkYYvzb3IJlb2PXhlVmPKFhPCCHVPeHCU2enG9o6toiO/W5GUV5uIDh+HVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=B2ACoB+H; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="B2ACoB+H"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:Reply-To:MIME-Version:Date:
	Message-ID:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	In-Reply-To:References; bh=r/DPyCOKb9CHlsupcTq714J2hmRN1rJ3LyROXFIsDm8=;
	t=1719834875; x=1720266875; b=B2ACoB+H9F8RLlv/czmzXgZnzvuyI7QyvVVbtRuhKQ5MU5l
	w0OebsHAkaq49M9P+Ha5Qgv6fgQIsz2tOL4TTdy92jiNGR/vBaIYtlDRy4BtqupkOu2qE4ZLIIpQy
	IQwLLGnXK+0qgwqW7D9TPNcS6SnbxEIWZjvtdeEG/PUkOf41oAbdSn+gXIGJN/NfWkyrM5yDViMoS
	gsRlohISLnmYqAXj0sLgO5E36rXysZI6cRLwLqy0FBeTs+pfgG1p7fD2/M9zk7LgI8hIHpQQ/Tpr/
	2YROM4BjgFfxXQBHmZUzQ64c78pgrXUoLOHh8KT1v3DxzO9o4io7OaxNtOTL7b2w==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sOFby-0004jI-Co; Mon, 01 Jul 2024 13:54:22 +0200
Message-ID: <6767f6e1-f7b7-4b3e-8173-32f1472f56d6@leemhuis.info>
Date: Mon, 1 Jul 2024 13:54:21 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Subject: Re: [PATCH] ARM: Remove address checking for MMUless devices
To: Yanjun Yang <yangyj.ee@gmail.com>, linux-arm-kernel@lists.infradead.org
Cc: Mark Brown <broonie@kernel.org>, rmk+kernel@armlinux.org.uk,
 Ard Biesheuvel <ardb@kernel.org>, akpm@linux-foundation.org,
 ben@decadent.org.uk, Wang Kefeng <wangkefeng.wang@huawei.com>,
 Kees Cook <kees@kernel.org>,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <20240611100947.32241-1-yangyj.ee@gmail.com>
 <CAE8JAfxkbw4+wsKjoH1qyo1r69TpgLtfRjchTJ=4vVvvM46CuA@mail.gmail.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Content-Language: en-US, de-DE
In-Reply-To: <CAE8JAfxkbw4+wsKjoH1qyo1r69TpgLtfRjchTJ=4vVvvM46CuA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1719834875;70df2771;
X-HE-SMSGID: 1sOFby-0004jI-Co

On 12.06.24 03:25, Yanjun Yang wrote:
> Apologies for not CCing the relevant maintainers in my previous email.
> 
> On Tue, Jun 11, 2024 at 6:09 PM Yanjun Yang <yangyj.ee@gmail.com> wrote:
>>
>> Commit 169f9102f9198b ("ARM: 9350/1: fault:
>> Implement copy_from_kernel_nofault_allowed()") added the function to check
>> address before use. However, for devices without MMU, addr > TASK_SIZE
>> will always fail.  This patch move this function after the #ifdef
>> CONFIG_MMU statement.

What happened to this fix regression for a 6.9 regression? From here it
looks like it fell through the cracks, but I might be missing something.

>> Also reported at https://bugzilla.kernel.org/show_bug.cgi?id=218953

Side note: this afaics ideally should be:

 Closes: https://bugzilla.kernel.org/show_bug.cgi?id=218953

Ciao, Thorsten

>> Signed-off-by: Yanjun Yang <yangyj.ee@gmail.com>
>> ---
>>  arch/arm/mm/fault.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm/mm/fault.c b/arch/arm/mm/fault.c
>> index 67c425341a95..ab01b51de559 100644
>> --- a/arch/arm/mm/fault.c
>> +++ b/arch/arm/mm/fault.c
>> @@ -25,6 +25,8 @@
>>
>>  #include "fault.h"
>>
>> +#ifdef CONFIG_MMU
>> +
>>  bool copy_from_kernel_nofault_allowed(const void *unsafe_src, size_t size)
>>  {
>>         unsigned long addr = (unsigned long)unsafe_src;
>> @@ -32,8 +34,6 @@ bool copy_from_kernel_nofault_allowed(const void *unsafe_src, size_t size)
>>         return addr >= TASK_SIZE && ULONG_MAX - addr >= size;
>>  }
>>
>> -#ifdef CONFIG_MMU
>> -
>>  /*
>>   * This is useful to dump out the page tables associated with
>>   * 'addr' in mm 'mm'.
>> --
>> 2.45.2
>>
> 
