Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60EBE1D6DDA
	for <regressions@lists.linux.dev>; Sun, 30 Mar 2025 16:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743352548; cv=none; b=TAs54+KAZ0otY9suQkRXk8hYFc6xxTeZ9QbUGoLsryj9f8ApSKv0wcjjYgL5lIdnpx5sZaItelwbhwB6HEIhJvFREtI57khEQQ0vDGvjllmFcxC8R+sC/RYek3bXZErrC2UiXieHpEsv44R9QxgJ6QYn7NLQjATqAhxOxug7dJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743352548; c=relaxed/simple;
	bh=S4RODy1Q/hZZxDPN61Kt7DmGQaqQa/2RGDWfOBPMSdU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s5cUgzcRvNcnlcy6f1PA8TNrWyISZOBXSayTGeEMx91LhtkEqJ6ehlbK6uqbokEUMljWQ2ddArU+HbRQamao7vpAJMtXy7zbCjlKWCGKoXqztqBhIwgUsKW/Sp3LwCACoZbvDd6uuso4ASJ+C27b0EzsO2vzoWw7KliNSGAs/WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hi3Cowwl; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hi3Cowwl"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43d07ca6a80so19639685e9.1
        for <regressions@lists.linux.dev>; Sun, 30 Mar 2025 09:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743352544; x=1743957344; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uuOuqty0i2CYwtRK3Rp+qfQDE4owvRyeSN1m7kjYXkQ=;
        b=Hi3Cowwlvfq8/Jexjjz5UyE/AkaCxKP0k+hoc5l/jEiZ7zQ2dYdlr+pm5ipcsH7yvZ
         71gQoJf/vpOm2lPwi0cjzplwj1oRzSN2Of47gnXf15iXb8dKHJBbyJs6y7WZm7wp1Duw
         TMH1b0se64via+bTz1F1zTCOVzBc6vbbls8iBBbNeNe36TZ0pE9A+YrNFro7rtsdihwC
         EcL3oAeQN75jZURPFBz8ztJWxsJ8Evr8JKcd85pu80ffLaivOIacqnn6IiD3QLce4a+8
         /UobkbvkWGvRHtSehOMdUgYbVjWLJJqLmLNJNS7Yhs0ryUnt6wrksytZXyr7q/RSaoTb
         rlAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743352544; x=1743957344;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uuOuqty0i2CYwtRK3Rp+qfQDE4owvRyeSN1m7kjYXkQ=;
        b=UZrj3Uy2zTSvYwBPujzxzF/PSw6IKzB/TpExsyUecRd2OhY/dawVRcWHRoThtEjcSX
         pQIAwiFV9toIdDm/Wy8KetpFOBlTSSS1MPtRYYe3/7Ik6wJ8B1jLulOj8zWKlcnqVqKq
         9Nhefow8i4aYH3hCmdhdu98XSQhmn1cn8gUiqIibmedBeQhN2Uc5uGqsByCwQNLN0e5u
         GkkxHi+5YWkIMjrU81Gt16bjEKtxsEtmq1BVT5aClzds4/D/poMeH7603xf6/2QMYs4h
         8bVKqT8W3wbuhRgiZGPV4cr003Yrse7e3qk1R9pSsP2Hclk/ZXW6g9XTONKj9Z3HALAs
         1raA==
X-Forwarded-Encrypted: i=1; AJvYcCW2B6yL/74vIhzJ1b7GLcGrOABiIkNnPKthayuvu6tN34Ba1069LXXy3EFwDgLf+YL2cBpgQAhM6ZYtJg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxon11NH9hPVngjnOcSMxrioIak50T9vpqftBWQqk2s4b3ZaWgc
	R9/VI4Nj5eC3380ZQ7F+KwOGd6+vI6dPCVGQa4qzKW9TyDMKOfcT
X-Gm-Gg: ASbGncvUhNBVHD4ly8HwKyJG149v+k9020gq5Ip822EFCowoi34bacTWU9ZXMbE8UfA
	SSb2ZvswMwJcXTTbwkfeBz29+ivT3eq9XOnIzZABI3SjRFxIYDplZ3OJh34h0/2eNiFO6wsWPPH
	slaLZFZE8Ta6AQGS0i+S0eKCPc5r+iedu/7VfiNIdIxqUc/HDq7X++FCeqmt/7cBQDltfagrxt+
	dVqBIE8Lx4OzZ+U0EwNJ1rfaUNUM5dj0pWGm7Ki6Re4+YgftDfyIh1TxDMtZdNDix/g/JOGS3vN
	ilkZz53rWRx7/x/W8sA86l8TEdpF4y6mj7LD2/KIgz3T86LzztL5Fecg6dsHK+vu+T1ui/Yua+F
	fecoz/hxbn6Vb3fgTISH046JRPKw=
X-Google-Smtp-Source: AGHT+IHoyEbJ5/v1QJFBuWxBOsgt/kiZQGVTRtOGc8h5L9u1NHxhfrrZbHC8fyaTQD6E9ugMTRFeLg==
X-Received: by 2002:a05:6000:2b03:b0:391:4674:b10f with SMTP id ffacd0b85a97d-39c121188demr3552253f8f.36.1743352544412;
        Sun, 30 Mar 2025 09:35:44 -0700 (PDT)
Received: from [192.168.10.195] (net-188-216-175-96.cust.vodafonedsl.it. [188.216.175.96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b6627bfsm8820607f8f.25.2025.03.30.09.35.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Mar 2025 09:35:43 -0700 (PDT)
Message-ID: <efde5e18-672f-484f-90c3-d23d673daa18@gmail.com>
Date: Sun, 30 Mar 2025 18:35:43 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Regression: mt7921e unable to change power state from d3cold to
 d0 - 6.12.x broken, past LTS 6.6.x works
To: Christian Heusel <christian@heusel.eu>
Cc: Greg KH <gregkh@linuxfoundation.org>, stable@vger.kernel.org,
 Linux Regressions <regressions@lists.linux.dev>
References: <415e7c31-1e8d-499b-911e-33569c29ebe0@gmail.com>
 <2025031923-rocklike-unbitten-9e90@gregkh>
 <5e260035-1f1b-4444-b3b8-1b5757e5ed08@gmail.com>
 <38658f1a-216b-470d-99a2-13d66f075c77@heusel.eu>
Content-Language: en-US, it-IT
From: Sergio Callegari <sergio.callegari@gmail.com>
In-Reply-To: <38658f1a-216b-470d-99a2-13d66f075c77@heusel.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Christian,

Thanks for your nice offer, details below:

On 20/03/2025 11:05, Christian Heusel wrote:
> Hey Sergio,
> 
> On 25/03/20 08:49AM, Sergio Callegari wrote:
>> Might be able to test on the distro built kernels that basically trace the
>> releases and stable point releases. This should start helping bracketing the
>> problem a bit better as a starter. But it is going to take a lot of time,
>> since the issue happens when the machine fails to get out of hibernation,
>> that is not always, and obvioulsy I need to try avoiding this situation as
>> much as possible.
> 
> Which linux distro are you using? If you're on Arch Linux I can provide
> you with prebuilt images for the bisection :)

I am on manjaro, where the kernel follows slightly different naming 
conventions, but the arch kernels should be OK. So thank you very much 
for the nice offer. The thing is possibly a bit premature, in that I 
would like to identify first what is the kernel RC or point release 
where the issue started to appear, because I have these kernels 
available for my distro which makes things easier. Unfortunately, I am 
still in the dark even wrt this.

The issue is nasty, because it only happens when you crash on restore 
from hibernation, which is something that I am desperately trying to 
avoid because this is my work machine and I really don't want to risk 
data loss.

The big problem with this bug is that you remain with the impression 
that your hardware is bricked. On the web I read that booting windows 
immediately gives you back the wifi device on pcie, but I really cannot 
say, as I have no windows to try. What I can say is that the 6.6 LTS 
kernel also lets you recover the WIFI, while 6.12 LTS does not.

As a stopgap, would be great to know if there is anything that can be 
done while on 6.12 to fully reset the pcie (or the pcie device, I still 
don't know what is the culprit), so you don't need to boot an older kernel.

Thanks again,
Sergio

> 
>>
>> Incidentally, the machine seems to hibernate-resume just fine. It is when I
>> suspend-then-hibernate that I get the failures.
>>
>> Before contacting the network driver authors, I just wanted to query whether
>> the issue is likely in it or in the power-management or pcie subsystems.
>>
>> Thanks,
>> Sergio
> 
> Cheers,
> Chris
> 
>>
>> On 20/03/2025 00:54, Greg KH wrote:
>>> On Wed, Mar 19, 2025 at 08:38:52PM +0100, Sergio Callegari wrote:
>>>> There is a nasty regression wrt mt7921e in the last LTS series (6.12). If
>>>> your computer crashes or fails to get out of hibernation, then at the next
>>>> boot the mt7921e wifi does not work, with dmesg reporting that it is unable
>>>> to change power state from d3cold to d0.
>>>>
>>>> The issue is nasty, because rebooting won't help.
>>>
>>> Can you do a 'git bisect' to track down the issue?  Also, maybe letting
>>> the network driver authors know about this would be good.
>>>
>>> thanks,
>>>
>>> greg k-h
>>
>>

