Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079B121B9C9
	for <regressions@lists.linux.dev>; Mon, 23 Jun 2025 21:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750714092; cv=none; b=riL3F3W19B5C1sLeZdAeK2JSEs1ipicfQB+uSmpCCXoVkSaH+Vkv0jODhUuAwSK4OVTcXRCyKPeYk/xUvKmLt6hegVKdRJZ7VMM0ue9ggq/nwjIsGvLwWLgUjr9gguZ+vIlTtmkmlbv7Kb3L6hk5jLe9g5v5IEVlnsCKWlQWPUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750714092; c=relaxed/simple;
	bh=q+6mZDY66m9z8HN3uJ1Y6m6Uw15FIGzox4xTgErCUEE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=H5JLH3LG46VAO1DGNHVncb2htR0jalIBBaWGsBaNdC3VTAVo1R0plCVqqglorO2hZQD7tNQJp3ZdTK90kyGSP+dThH+zUDNzNUPhBMfsZtMkfZ9aJbnj9lcNzNi+R5sLHC6iLcyxvEpiUTRSBqux85qOHwHJFSR5LOlcAj2OKbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YpVEn97e; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YpVEn97e"
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3ddda14b56cso20056795ab.0
        for <regressions@lists.linux.dev>; Mon, 23 Jun 2025 14:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750714089; x=1751318889; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mmg3QjE2BdxChGIIWWePaatjao0EfwLXqcZXwwKYC+A=;
        b=YpVEn97eQ1xbiiqFGfilpy4jatgVZicJy72wMLPRud7hjQ7YkLt+eASTa811qBpqBO
         RNNxn8jaSwB+vB4amfZDcnHlaFUJqnaFA1nbS9SzWzGRvlaKn8QMZ70pYRi4fOmtplZ1
         BMGeKl665XAyXYGJ3zDbNMlQbFNLbelolwu0nHghOgGPUyISWPgMUQk1trS44t/hy6D5
         /1tdKIAcGLebsIwqiICezt1+tkK1i+64PolhjR3GfH3yGPQY9EvPaeH5PygaZwTUVUzJ
         Evs2b74LlDc5FP9nXMUD6W3qJABSWvTFlWOI85W4hz1Ad149bSXOeholQ7XaDM0mFLCr
         ztxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750714089; x=1751318889;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mmg3QjE2BdxChGIIWWePaatjao0EfwLXqcZXwwKYC+A=;
        b=mFQTQ0FCnKoxbF/BR1ZnfwWs+7D6IMQpfV2yw0781a8e/7OFfkVgxasRcJ8tUZ7iVB
         94LqPz+neaVoUrC5jPo8vnQ4K4TF6P4Ziufs/6jzZSdRfJK4Rptp72tK9FSr1saZDu7z
         HLZfFGcaDdhwhxhpRtLPEpu8NFKhZTB80LwvvRbBjwE2p4UmJn6bAscUMOJYiJsu3mSA
         nsmUBeJ2GmdtHVZfrO4g4VrALDeVwoet8zytLFS38rwcovBUfHMLRhNBd+xmUPHLDkc1
         yH7cJd40apxaiQ9wIg6dHDtrxpAekFBWV/XY4lw4QcT6SqvR8ddA1cltOwuumOE12NUa
         e/UQ==
X-Forwarded-Encrypted: i=1; AJvYcCVt41IOMEEecaYOnwY5VL4vyTtEL98h7jRRrQb3zYgrOZQd7PiyNKnpmRTTVRdH5oWJMQ88BMMenA/yaA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7kxSLdZiz68ohlbLwlDV5oLOYKaJ/G85lPgp6HRC3MbHXhuLb
	b2NwR6bDVWG58wp8OFh/ij85oKAGlj3HKE9cwyABW4+xhFYPOn8ymXQO
X-Gm-Gg: ASbGncsdWhDptvLPrehV0MMz4NWqB9f5IDniHZpqqxKj8+RZEJy3x/UgV4oKiOwDlAX
	+WNgor1v588D2qued7VifUmriWlWKexNxuHOlkHBmM+y4uBic6j7rmRJDuaFkl6spXqBWLMtshG
	EouBNeJeHVuurAYvvyDEU0urEEuJUzP/Vd+H6M+YIc/q/WM+YpSS6MphNqYyp0Dsas92KnVWGcI
	xhXpOHP8wezAH4EFHdx7zlWNXEY4gImRnulTwf61dcIDej6GiGakjDXps2nW1X2q0IxKKIVhG9L
	dhe+HLMhrLcBhlX+ODiBldH36PpH9s+96kuxI/PCOMthIu/ebf0Dnr1mgqublrE=
X-Google-Smtp-Source: AGHT+IGMp2D173TTSTMU8VIk4VqmO6g0lVUpD7nUPuZHAAmYTIqx3KZhAsGTNzEPrXH7ly3mDyftVQ==
X-Received: by 2002:a05:6e02:3b85:b0:3de:128d:15c4 with SMTP id e9e14a558f8ab-3de38609a32mr161505805ab.0.1750714088955;
        Mon, 23 Jun 2025 14:28:08 -0700 (PDT)
Received: from ?IPV6:2601:282:d00:94b1::174? ([2601:282:d00:94b1::174])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3de37747762sm31687575ab.58.2025.06.23.14.28.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 14:28:08 -0700 (PDT)
Message-ID: <ef467aa9-6ec5-4917-966c-596640852c9a@gmail.com>
Date: Mon, 23 Jun 2025 15:28:05 -0600
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [regression v6.12.30..v6.12.32] mmc1: mmc_select_hs400 failed,
 error -110 / boot regression on Lenovo IdeaPad 1 15ADA7
From: Jeremy Lincicome <w0jrl1@gmail.com>
To: Salvatore Bonaccorso <carnil@debian.org>
Cc: Shawn Lin <shawn.lin@rock-chips.com>, regressions@lists.linux.dev,
 Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
 1108065@bugs.debian.org, stable@vger.kernel.org, net147@gmail.com
References: <aFW0ia8Jj4PQtFkS@eldamar.lan> <aFXCv50hth-mafOR@eldamar.lan>
 <004c6e95-7c1b-4a7f-ab68-1774ce5a51d7@rock-chips.com>
 <aFmPQL3mzTag5OxY@eldamar.lan>
 <35be0df5-b769-43ce-a9c4-7df4d4683dab@gmail.com>
 <aFml-1X0-vItR2Au@eldamar.lan>
 <8f8671c5-fefb-494a-9cb6-0f6412566164@gmail.com>
Content-Language: en-US
In-Reply-To: <8f8671c5-fefb-494a-9cb6-0f6412566164@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/23/25 15:08, Jeremy Lincicome wrote:
> Hi,
>
> On 6/23/25 13:07, Salvatore Bonaccorso wrote:
>> Hi,
>>
>> On Mon, Jun 23, 2025 at 12:58:43PM -0600, Jeremy Lincicome wrote:
>>> On 6/23/25 11:30, Salvatore Bonaccorso wrote:
>>>> On Mon, Jun 23, 2025 at 05:13:38PM +0800, Shawn Lin wrote:
>>>>> + Jonathan Liu
>>>>>
>>>>> 在 2025/06/21 星期六 4:21, Salvatore Bonaccorso 写道:
>>>>>> On Fri, Jun 20, 2025 at 09:20:41PM +0200, Salvatore Bonaccorso 
>>>>>> wrote:
>>>>>>> Hi
>>>>>>>
>>>>>>> In Debian we got a regression report booting on a Lenovo IdeaPad 1
>>>>>>> 15ADA7 dropping finally into the initramfs shell after updating 
>>>>>>> from
>>>>>>> 6.12.30 to 6.12.32 with messages before dropping into the intiramfs
>>>>>>> shell:
>>>>>>>
>>>>>>> mmc1: mmc_select_hs400 failed, error -110
>>>>>>> mmc1: error -110 whilst initialising MMC card
>>>>>>>
>>>>>>> The original report is athttps://bugs.debian.org/1107979 and the
>>>>>>> reporter tested as well kernel up to 6.15.3 which still fails to 
>>>>>>> boot.
>>>>>>>
>>>>>>> Another similar report landed with after the same version update as
>>>>>>> https://bugs.debian.org/1107979 .
>>>>>>>
>>>>>>> I only see three commits touching drivers/mmc between
>>>>>>> 6.12.30..6.12.32:
>>>>>>>
>>>>>>> 28306c58daf8 ("mmc: sdhci: Disable SD card clock before changing 
>>>>>>> parameters")
>>>>>>> 38828e0dc771 ("mmc: dw_mmc: add exynos7870 DW MMC support")
>>>>>>> 67bb2175095e ("mmc: host: Wait for Vdd to settle on card power 
>>>>>>> off")
>>>>>>>
>>>>>>> I have found a potential similar issue reported in ArchLinux at
>>>>>>> https://bbs.archlinux.org/viewtopic.php?id=306024
>>>>>>>
>>>>>>> I have asked if we can get more information out of the boot, but 
>>>>>>> maybe
>>>>>>> this regression report already rings  bell for you?
>>>>> Jonathan reported a similar failure regarding to hs400 on RK3399
>>>>> platform.
>>>>> https://lkml.org/lkml/2025/6/19/145
>>>>>
>>>>> Maybe you could try to revert :
>>>>> 28306c58daf8 ("mmc: sdhci: Disable SD card clock before changing
>>>>> parameters")
>>>> Thanks.
>>>>
>>>> Jeremy, could you test the (unofficial!) packages at
>>>> https://people.debian.org/~carnil/tmp/linux/1108065/ which consist of
>>>> 6.12.33-1 with the revert patch applied on top?
>>>>
>>>> I have put a sha256sum file and signed it with my key in the Debian
>>>> keyring for verification.
>>> Do I need all those packages?
>> Just the linux-image-6.12+unreleased-amd64-unsigned package to test
>> the patched kernel image and modules.
>
> I installed the package, and this is as far as I got.
> <https://share.bemyeyes.com/chat/oJcrv3N22q>
> for anyone who doesn't know, the above link is from Be My Eyes, an app 
> that allows me to read information not available with a screen reader 
> like Orca.
> I'm blind, and unable to read the Grub menu independently.
> I ran a bash script to extract the menu number for that kernel, then 
> ran grub-reboot to try and boot it on the next reboot.
> As far as I can tell, the system is trying to boot,but fails and 
> returns to Grub. Am I doing something wrong?

For those of you who got my last message twice, I apologize. Some of the 
lists rejected it for having html.

-- 
Sincerely,
Jeremy Lincicome W0JRL
JL Applied Technologies:
https://jlappliedtechnologies.com
SkyHubLink System:
https://skyhublink.com

