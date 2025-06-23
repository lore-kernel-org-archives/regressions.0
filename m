Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AEAF27A914
	for <regressions@lists.linux.dev>; Mon, 23 Jun 2025 18:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750705130; cv=none; b=bvBIFD8UgV3q3orOKxBywvDdKb4LQyHQLNcSq5GebNG7uhwzOfPq/7IlVTPsqmSU+uhwhGsLTbdi6dG2bAHGParkrpPie9lSsJhyAIjSEl9kXeIfyAKlMmkVxGW0ulKNlLYZ2vNgI3D3Ok0xnarj76PmFwY/4SwgpieirMKLzF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750705130; c=relaxed/simple;
	bh=rhADofRa7O4H0skYApDvI203y7IyE8m8fYDqZM8dcGg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HFcU4BPksdCinOY1F3i8C4ExTGJmwvAvMtIxUJNN03cOa/aulmT5BFsdt+0gbkBbVstom4jSHYBO1FRAUzrI/vBI/VMdM6iCSOrn8RHDZATwXq7ya3U2KWI01TFrhhBdSv8OGp6FpPVwHtlVBnfVT4A6m23KINQPtfA3Nwi34c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MwxkD9aD; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MwxkD9aD"
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3ddd1cf40cfso16451885ab.1
        for <regressions@lists.linux.dev>; Mon, 23 Jun 2025 11:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750705128; x=1751309928; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MP4/EwOfYKCDCUoXktdSHMft9I2G71yNGwbmuuIqBcU=;
        b=MwxkD9aDCvjv0vkeyuQy9fZxuxoQK0G1AxxkVgoQIY8Hu0VriQAUVr+0m3EI7ZxdNV
         uFN9sE6T91wHzmbdNBe/fEpl9exaFw2twtUGtEVRXqCYcfXF2sLAYaPQXHHLOVo7CMGB
         VRRz2XhvAht9zyRFogTa4H4etGMI9sYsPGPjcGd8YTKaYHk/yfZLJTvMxyfZL9SZxN77
         sisRHpfATnpAG5RhEi+E30eSulvPsEeJyuul2sHvoZ3DSvbsT2J/oooxAsiSjDGp1sq1
         a9ieX3+XdClMKG3OyGGbjt2NXO7R2DJ/RUpjmh75Ic7QoxuDQ3yBgp6js1e5P1M6Td34
         9RiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750705128; x=1751309928;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MP4/EwOfYKCDCUoXktdSHMft9I2G71yNGwbmuuIqBcU=;
        b=FGI8wHHs7b6lR8w0GINFodl8+QI5ssGpQ2/0byUYFE1C+4mu9kHg56iiTdQnqKrqQQ
         5zEtdLF0vyhAklsMCZP6vtjrqmIw3I4IFm73iG9htQwN3cMvyeGdwem8T3cZ09BA9b/i
         Qvo8Wby9Pbk+odoLYmi67k/+/0qnA2AACnVieJULKYVwd++gW92jdCp/cUNh/jQRedlS
         iPdlt9AWehnDx5AGfvVZJSEBPx/96A80AYvZfal8o1/NM1bRqhTkOKRY9VtOfPetMr/D
         ZmGKV8YmusLY2wkfRhcSoDFMPgnkab7Fg1DyenVWC+DJrhxq/sJ5t8qgoCUsKArD5FPK
         yIhg==
X-Gm-Message-State: AOJu0YyfAypCcH03OH8MAZinORn5msKRqITlS+Ou1Ds+qt+EuDgMyqO+
	gfiQ1QHDWLzVJZmi6u58dPNjLuIseSgfbjr3p909zSdpVS+j1orgYX8FcsFcWXpJQVc=
X-Gm-Gg: ASbGnctG4yzH0tuN5Plw9bftZLDgQhmr72vwrfwOkMlroPls2PWn2MH9YLgBaiZTpgO
	AiVn/7+zTzZsSVzIw9m70FuqnKwQJDogH9jDFr6OscXOgN47DiJ08UmWxdC0KK6FtOACBr52J24
	FZJPGXgrpCESwrtBjt6o3CNxpSaocLUce4XLtvfsuAdfy7lop/Tv3uNg8vaoi3HAo+KRr8tz+Zk
	JPt8gxrnAGxAzPK/ykr3KxaRn7VRDgsy9NJO7aHtby4mZ5uHzW4AwCg/dYcLm58orPnx/IS0LTs
	DNn6t72ZGigsXaEHMMteLeLzOG2dQ7bx2ZJfkrG4lH8TNoL9flpNR2bvZBHqPC4=
X-Google-Smtp-Source: AGHT+IGq7SQj5SmZz8Hpl6EooXTFSR/8w2FZsjF+64YhQ7iJGzlMjuOg5izaDG7IguL2UhJYems0CA==
X-Received: by 2002:a05:6e02:318f:b0:3dd:892d:b25e with SMTP id e9e14a558f8ab-3de38cc300cmr153205025ab.22.1750705127477;
        Mon, 23 Jun 2025 11:58:47 -0700 (PDT)
Received: from ?IPV6:2601:282:d00:94b1::174? ([2601:282:d00:94b1::174])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3df103bf07esm19200985ab.62.2025.06.23.11.58.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 11:58:46 -0700 (PDT)
Message-ID: <35be0df5-b769-43ce-a9c4-7df4d4683dab@gmail.com>
Date: Mon, 23 Jun 2025 12:58:43 -0600
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [regression v6.12.30..v6.12.32] mmc1: mmc_select_hs400 failed,
 error -110 / boot regression on Lenovo IdeaPad 1 15ADA7
To: Salvatore Bonaccorso <carnil@debian.org>,
 Shawn Lin <shawn.lin@rock-chips.com>
Cc: regressions@lists.linux.dev, Ulf Hansson <ulf.hansson@linaro.org>,
 linux-mmc@vger.kernel.org, 1108065@bugs.debian.org, stable@vger.kernel.org,
 net147@gmail.com
References: <aFW0ia8Jj4PQtFkS@eldamar.lan> <aFXCv50hth-mafOR@eldamar.lan>
 <004c6e95-7c1b-4a7f-ab68-1774ce5a51d7@rock-chips.com>
 <aFmPQL3mzTag5OxY@eldamar.lan>
Content-Language: en-US
From: Jeremy Lincicome <w0jrl1@gmail.com>
In-Reply-To: <aFmPQL3mzTag5OxY@eldamar.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/23/25 11:30, Salvatore Bonaccorso wrote:
> On Mon, Jun 23, 2025 at 05:13:38PM +0800, Shawn Lin wrote:
>> + Jonathan Liu
>>
>> 在 2025/06/21 星期六 4:21, Salvatore Bonaccorso 写道:
>>> On Fri, Jun 20, 2025 at 09:20:41PM +0200, Salvatore Bonaccorso wrote:
>>>> Hi
>>>>
>>>> In Debian we got a regression report booting on a Lenovo IdeaPad 1
>>>> 15ADA7 dropping finally into the initramfs shell after updating from
>>>> 6.12.30 to 6.12.32 with messages before dropping into the intiramfs
>>>> shell:
>>>>
>>>> mmc1: mmc_select_hs400 failed, error -110
>>>> mmc1: error -110 whilst initialising MMC card
>>>>
>>>> The original report is at https://bugs.debian.org/1107979 and the
>>>> reporter tested as well kernel up to 6.15.3 which still fails to boot.
>>>>
>>>> Another similar report landed with after the same version update as
>>>> https://bugs.debian.org/1107979 .
>>>>
>>>> I only see three commits touching drivers/mmc between
>>>> 6.12.30..6.12.32:
>>>>
>>>> 28306c58daf8 ("mmc: sdhci: Disable SD card clock before changing parameters")
>>>> 38828e0dc771 ("mmc: dw_mmc: add exynos7870 DW MMC support")
>>>> 67bb2175095e ("mmc: host: Wait for Vdd to settle on card power off")
>>>>
>>>> I have found a potential similar issue reported in ArchLinux at
>>>> https://bbs.archlinux.org/viewtopic.php?id=306024
>>>>
>>>> I have asked if we can get more information out of the boot, but maybe
>>>> this regression report already rings  bell for you?
>> Jonathan reported a similar failure regarding to hs400 on RK3399
>> platform.
>> https://lkml.org/lkml/2025/6/19/145
>>
>> Maybe you could try to revert :
>> 28306c58daf8 ("mmc: sdhci: Disable SD card clock before changing
>> parameters")
> Thanks.
>
> Jeremy, could you test the (unofficial!) packages at
> https://people.debian.org/~carnil/tmp/linux/1108065/ which consist of
> 6.12.33-1 with the revert patch applied on top?
>
> I have put a sha256sum file and signed it with my key in the Debian
> keyring for verification.

Do I need all those packages?

-- 
Sincerely,
Jeremy Lincicome W0JRL
JL Applied Technologies:
https://jlappliedtechnologies.com
SkyHubLink System:
https://skyhublink.com

