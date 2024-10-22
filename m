Received: from mail.581238.xyz (86-95-37-93.fixed.kpn.net [86.95.37.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B4B1A01DD
	for <regressions@lists.linux.dev>; Tue, 22 Oct 2024 15:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=86.95.37.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729611862; cv=none; b=c3avekvrTStD7drukQ1Qjpigd0WHmDIN3M768EDqCbrDkYwI+cXBjC78ZQ6TCtq5KdcnLrKLOwaDwBFOMl+Z2Zp0tleOwpCr5Ri0ueYhRMlXIXd+4659rqOHwqvlfg4YZKpvEh0nXFqgJfDgJrN7ntRRJXoD3IXI/QogZcBr128=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729611862; c=relaxed/simple;
	bh=YtDLOlpLRRBvDmLW/cArjrA+sbMExZ1uTkluU2L1WL8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EPCskraasCO8zo0Bf94bmYKpnj+sgztWc7WsghxeA2kQgh1fxL7VblBT/nEzZpfGh/id887Y/EQbnVKj3pVKCQAU2/klzLsSG+s0WXMaJ8BHGiCnAjxEyNLa54mjq5tc051OCoXd4mwwRnQFW6TnCBvG0sHaHXWm/2jRdfGE198=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=581238.xyz; spf=pass smtp.mailfrom=581238.xyz; dkim=pass (1024-bit key) header.d=581238.xyz header.i=@581238.xyz header.b=XzSmL3Bg; arc=none smtp.client-ip=86.95.37.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=581238.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=581238.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=581238.xyz header.i=@581238.xyz header.b="XzSmL3Bg"
Received: from [192.168.1.14] (Laptop.internal [192.168.1.14])
	by mail.581238.xyz (Postfix) with ESMTPSA id 5123D43088FB;
	Tue, 22 Oct 2024 17:44:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=581238.xyz; s=dkim;
	t=1729611858; bh=YtDLOlpLRRBvDmLW/cArjrA+sbMExZ1uTkluU2L1WL8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=XzSmL3Bg4KaaWhmNZkNMIOG0iNeTva2qOyq6Hjl1YyrOyBaRP8dodAnv6zE0Qql1W
	 02bOEPjsCQR7Rm96NRtD/NsOZtoLJ4jWnrl8zR6AdW/mmXTg26v0wyTEuxRgiybFPG
	 mYk3kZAIlsdtr7kt4hdOXBp79oaxD7oKB3b8lLnY=
Message-ID: <22415e85-9397-42db-9030-43fc5f1c7b35@581238.xyz>
Date: Tue, 22 Oct 2024 17:44:18 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Dell WD19TB Thunderbolt Dock not working with kernel > 6.6.28-1
To: Mario Limonciello <mario.limonciello@amd.com>,
 mika.westerberg@linux.intel.com
Cc: Sanath.S@amd.com, christian@heusel.eu, fabian@fstab.de,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 regressions@lists.linux.dev, stable@vger.kernel.org
References: <000f01db247b$d10e1520$732a3f60$@581238.xyz>
 <96560f8e-ab9f-4036-9b4d-6ff327de5382@amd.com>
Content-Language: en-US
From: Rick <rick@581238.xyz>
In-Reply-To: <96560f8e-ab9f-4036-9b4d-6ff327de5382@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Mario,

I apologize. I think I mixed up the versions between linux-lts and linux 
kernel.

linux-6.6.28-1-lts works: 
https://gist.github.com/ricklahaye/610d137b4816370cd6c4062d391e9df5
linux-6.6.57-1-lts works: 
https://gist.github.com/ricklahaye/48d5a44467fc29abe2b4fd04050309d7

linux-6.11.4-arch2-1 doesn't work: 
https://gist.github.com/ricklahaye/3b13a093e707acd0882203a56e184d3f
linux-6.11.4-arch2-1 with host_reset on 0 also doesn't work: 
https://gist.github.com/ricklahaye/ea2f4a04f7b9bedcbcce885df09a0388

Kind regards,

Rick


On 22-10-2024 14:55, Mario Limonciello wrote:
> On 10/22/2024 07:13, rick@581238.xyz wrote:
>> Hi all,
>>
>> I am having the exact same issue.
>>
>> linux-lts-6.6.28-1 works, anything above doesn't.
>>
>> When kernel above linux-lts-6.6.28-1:
>> - Boltctl does not show anything
>> - thunderbolt.host_reset=0 had no impact
>> - triggers following errors:
>>    [   50.627948] ucsi_acpi USBC000:00: unknown error 0
>>    [   50.627957] ucsi_acpi USBC000:00: UCSI_GET_PDOS failed (-5)
>>
>> Gists:
>> - https://gist.github.com/ricklahaye/83695df8c8273c30d2403da97a353e15 
>> dmesg
>> with "Linux system 6.11.4-arch1-1 #1 SMP PREEMPT_DYNAMIC Thu, 17 Oct 
>> 2024
>> 20:53:41 +0000 x86_64 GNU/Linux" where thunderbolt dock does not work
>> - https://gist.github.com/ricklahaye/79e4040abcd368524633e86addec1833 
>> dmesg
>> with "Linux system 6.6.28-1-lts #1 SMP PREEMPT_DYNAMIC Wed, 17 Apr 2024
>> 10:11:09 +0000 x86_64 GNU/Linux" where thunderbolt does work
>> - https://gist.github.com/ricklahaye/c9a7b4a7eeba5e7900194eecf9fce454
>> boltctl with "Linux system 6.6.28-1-lts #1 SMP PREEMPT_DYNAMIC Wed, 
>> 17 Apr
>> 2024 10:11:09 +0000 x86_64 GNU/Linux" where thunderbolt does work
>>
>>
>> Kind regards,
>> Rick
>>
>> Ps: sorry for resend; this time with plain text format
>>
>>
>
> Can you please share a log with 'thunderbolt.host_reset=0 
> thunderbolt.dyndbg' on the kernel command line in a kernel that it 
> doesn't work?  This should make the behavior match 6.6.28 and we can 
> compare.
>
> Maybe the best thing would be:
> * 6.6.28 w/ thunderbolt.dyndbg
> * 6.6.29 w/ thunderbolt.dyndbg thunderbolt.host_reset=0
>
