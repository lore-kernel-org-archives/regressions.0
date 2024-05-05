Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B795B6FA8
	for <regressions@lists.linux.dev>; Sun,  5 May 2024 12:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714912633; cv=none; b=Qo0dLj7/aCJ7WHBsC/eVl4qj1mZFDVEXpQQP+x+LUTjojCSOfWvUnhoFJYhKyXhBM6nbTgXmfbVXFvJzP1QlAFVA5Y74qlAU+7rkmldtICORcLdut6rxutDtHA56RQUS7t25ampgthcZN+LiSfCr5tVKr1KTPSakRDDRfEvmZaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714912633; c=relaxed/simple;
	bh=zDpolQWfbcUK7TyiyiEtd0WxsaMTnXf/81eP72pe0Dg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AOeDpJdVc+4F14VqGCW+0GGC68C5+tbQiSXWhsi+ZRljZwEyAnDUi54AE8yPjbbM/GvxvhYPWMVVSMUD83rfKgFjHHqenCGrI0fktQXDxiYxr8Ab1eXNrNpByDFzf7X4HtlVsd42GxGHl80dgGNsKYWxUzEi76Xs91FDH+lOMYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k5Cdk6To; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k5Cdk6To"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-6ee4dcc4567so885368a34.3
        for <regressions@lists.linux.dev>; Sun, 05 May 2024 05:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714912630; x=1715517430; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q7UNaT1dFoDbZk1Tb2yzB1trkO0W5vpyMHkgqY156n0=;
        b=k5Cdk6Tos2GsVxTLoMqegNkVikpSR+4iGQ191+/v2slyqdmNBuWRr/VSUwB7767GVh
         pNphs8SIJoa5VCiBZgHZL3Sawb0OH3HdqKu/tkVdm5GR3fEe99X+Y8CIM/bP+pUvkWc+
         xUh3io9J7UIva3Hnnjw8bEPv7pABPNVP9rgMtc6ChfoFxNbBRrGSh7jvEny4KlZd3wH9
         5QFg6mWriCkgGG0bz5KWXdOMxZfX/499YxLV7GK8uomMfCfnZmgsEP+47sKfiCTb+bjp
         BDHqC+DhvshqpmZqIIhm+3kyvWbrCn1cwlvVHqwaa5fH+yHA8ZYBXOdPcDD9ToZsW/D9
         goSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714912630; x=1715517430;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q7UNaT1dFoDbZk1Tb2yzB1trkO0W5vpyMHkgqY156n0=;
        b=CqnZMrjZg8Q+IRHn8rXVE+3Zb5QI53hHveogXHqCqjufTRa0Js4bvFZZc4yxjK1WYd
         TIIty28/QV2wr1tAX2kGambOA+1py2cayFCDDKvbEG2HadPfCTaDR2Bttr8z5wYwEUqH
         juzVJg7coULeSdV6FisDeFdEuCL5o3tlGS7IgaSvmge7sChIP/hTvwHJmzOITEjXbs8Y
         bjzH9vYHaQHIrYMdXbwM8fxBjvnlus9mT7OLOkDrNiCWrmARkTswucbdx/eTclbrgQcc
         tM3lCongDHSUUJa/g1yAswtizbVtlVag3eTv+vHCmXzo4/GTOfei1uJELRoPyVheQ+aP
         oWgg==
X-Gm-Message-State: AOJu0Yyu6O8AK6FPDbYwDanvAm1qhIIRXKirg2+nSvcyFGfQcypbx1Hh
	4AZwV8NOmnmLh1uhcF/RxCigpRVCHVARsXNDVxiN9GXn2SVr6K/KYrh1oM4A
X-Google-Smtp-Source: AGHT+IGmeBFls7M1T2mDkcdo593tJ529+B6AdsEDseoNn6Uj4zHGCr/ZveECxUPEZJG73iGmf+Ajag==
X-Received: by 2002:a05:6830:144a:b0:6ee:4ecc:3c39 with SMTP id w10-20020a056830144a00b006ee4ecc3c39mr8998993otp.25.1714912630187;
        Sun, 05 May 2024 05:37:10 -0700 (PDT)
Received: from ?IPV6:2600:1700:70:f700:3634:a35:99df:3386? ([2600:1700:70:f700:3634:a35:99df:3386])
        by smtp.gmail.com with ESMTPSA id cv7-20020a056830688700b006ee377bd3aesm1478999otb.44.2024.05.05.05.37.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 May 2024 05:37:09 -0700 (PDT)
Message-ID: <1eb96465-0a81-4187-b8e7-607d85617d5f@gmail.com>
Date: Sun, 5 May 2024 07:37:09 -0500
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] Thunderbolt Host Reset Change Causes eGPU
 Disconnection from 6.8.7=>6.8.8
To: Linux regressions mailing list <regressions@lists.linux.dev>,
 Micha Albert <kernel@micha.zone>
Cc: "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mario Limonciello <mario.limonciello@amd.com>
References: <wL3vtEh_zTQSCqS6d5YCJReErDDy_dw-dW5L9TSpp9VFDVHfkSN8lNo8i1ZVUD9NU-eIvF2M84nhfdt2O7spGu2Nv5-oz9FLohYO7SuJzWQ=@micha.zone>
 <3f1f55cb-d8df-4834-b22f-c195d161cab5@leemhuis.info>
Content-Language: en-US
From: Mario Limonciello <superm1@gmail.com>
In-Reply-To: <3f1f55cb-d8df-4834-b22f-c195d161cab5@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 5/4/24 23:59, Linux regression tracking (Thorsten Leemhuis) wrote:
> [CCing Mario, who asked for the two suspected commits to be backported]
> 
> On 05.05.24 03:12, Micha Albert wrote:
>>
>>      I have an AMD Radeon 6600 XT GPU in a cheap Thunderbolt eGPU board.
>> In 6.8.7, this works as expected, and my Plymouth screen (including the
>> LUKS password prompt) shows on my 2 monitors connected to the GPU as
>> well as my main laptop screen. Upon entering the password, I'm put into
>> userspace as expected. However, upon upgrading to 6.8.8, I will be
>> greeted with the regular password prompt, but after entering my password
>> and waiting for it to be accepted, my eGPU will reset and not function.
>> I can tell that it resets since I can hear the click of my ATX power
>> supply turning off and on again, and the status LED of the eGPU board
>> goes from green to blue and back to green, all in less than a second.
>>
>>     I talked to a friend, and we found out that the kernel parameter
>> thunderbolt.host_reset=false fixes the issue. He also thinks that
>> commits cc4c94 (59a54c upstream) and 11371c (ec8162 upstream) look
>> suspicious. I've attached the output of dmesg when the error was
>> occurring, since I'm still able to use my laptop normally when this
>> happens, just not with my eGPU and its connected displays.
> 
> Thx for the report. Could you please test if 6.9-rc6 (or a later
> snapshot; or -rc7, which should be out in about ~18 hours) is affected
> as well? That would be really important to know.
> 
> It would also be great if you could try reverting the two patches you
> mentioned and see if they are really what's causing this. There iirc are
> two more; maybe you might need to revert some or all of them in the
> order they were applied.

There are two other things that I think would be good to understand this 
issue.

1) Is it related to trusted devices handling?

You can try to apply it both to 6.8.y or to 6.9-rc.

https://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git/commit/?h=iommu/fixes&id=0f91d0795741c12cee200667648669a91b568735

2) Is it because you have amdgpu in your initramfs but not thunderbolt?

If so; there's very likely an ordering issue.

[    2.325788] [drm] GPU posting now...
[   30.360701] ACPI: bus type thunderbolt registered

Can you remove amdgpu from your initramfs and wait for it to startup 
after you pivot rootfs?  Does this still happen?

> 
> Ciao, Thorsten
> 
> P.s.: To be sure the issue doesn't fall through the cracks unnoticed,
> I'm adding it to regzbot, the Linux kernel regression tracking bot:
> 
> #regzbot ^introduced v6.8.7..v6.8.8
> #regzbot title thunderbolt: eGPU disconnected during boot
> 
