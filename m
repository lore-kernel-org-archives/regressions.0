Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC8C1C84AB
	for <regressions@lists.linux.dev>; Wed, 25 Jun 2025 03:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750823751; cv=none; b=jzsiGWixEm8q50AAvuRkXI8YAvWfEO3AR5OI4ZuTlizaQXDvf9cIVFJvp7gOBuKBF5zgyPNxVE1u2G0+1m3CmQ2zbm/8ryOdZ+QLRRmG0DnRtAk7Ay6PoBnRfGQN84Dv590ppstZ1xgOk1QFFXd9Y9R4hUIT9XwyQUrmRwYpX0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750823751; c=relaxed/simple;
	bh=M8HH45Sj8ttJXgcpCkJO8qkeo5a7N+Cjw/sh54F3uK0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TccliQNQR8r4upjxgl/xxAZsDSN1S7fyHTV9XR45INVBFA177ukDa4KntQdvdaDbsnX1VpV+MCmYRafbQfZrQyY15+IpRyYYAkS+Jv3UGQYz7TW5YhTRgHQfxcMgCSl8BpOuKKE5B+lW75LoA5GHoqoWPNdCLHfo/myBJNg/9Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M33O492u; arc=none smtp.client-ip=209.85.166.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M33O492u"
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-86cf3a3d4ccso116335539f.3
        for <regressions@lists.linux.dev>; Tue, 24 Jun 2025 20:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750823749; x=1751428549; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M8HH45Sj8ttJXgcpCkJO8qkeo5a7N+Cjw/sh54F3uK0=;
        b=M33O492uFLt3ZhGKtekpY20g8tlVMUA41bPPlNPoLZmMBSqrNaXucKeVn8gf08AWbp
         m4w6aKXwsuDFKbnO0qMfO49g0wtfncsMnm+YvYJl/3SbAFILnzt1EzH6rEDAYPJNZU3c
         LKsQSQxi4mvwdOBVyMvKmrboDlYcwVR+YtVKmz8FMSYQhxnmQzd6hc5/cyHhYPPJ6FFB
         /PdhNNTHnsQf9CEgQbkmqpL+v26dCANr3VHrvy4pc5BVMdEAeBSHKktUgBwcQYiTeIP8
         8pz8aQ8Ta5vlLzrhUfiO/q0AYPO+NyxkwOQ/aqPzX6obuRkkkr+lg8/OHJM8NSkQetcI
         ZcTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750823749; x=1751428549;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M8HH45Sj8ttJXgcpCkJO8qkeo5a7N+Cjw/sh54F3uK0=;
        b=YcOyaS2ByEQQCvxTQRHFFmdAmukDfGsRKVgkSP5wMSXXKMWGNNx019oy9+HJz0vKuj
         1VfKLLrxGUGLEBdf/g+8eDtJ+36FodSvh4uY9iOYnvdFi2D7Ku8HLYxJM1oENkGyDNJP
         onGcBtsKw3OD9tvQsgsWEStkz69a+q+Iak4sH0T1SLyG0sHcxeDJlEUZj9zC0j664xok
         0gDTj4upjH7OTSwGEWE+wvsm4ilE6O0sgQw2zyBsp9m2jn2JFN9HIymc3CtlchU2NBW+
         +lakjl7XJWM06wVGiqS+tkL/qxELldpwHPMRvPw9tlPnobJCfTpNS47RTMcUI9g/V+Rg
         /C6A==
X-Forwarded-Encrypted: i=1; AJvYcCVIO3OHUEH/sJ5vJjH7/n7PsPk09pBtggg+Pb5NvM0oDM96P2ta+vPCaOHoHngPBenqQDrK6HGgjRtgxA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxw2NDl7brH1+LUypBlXgcHuZcDrQrNKY5nTZg7NDXezOW3yEr9
	jIHZ4d9GuvsN1Zniq5SO4u1Zzd5n5nRzrcOSNu3XvFDA98xlpa8cJhE2
X-Gm-Gg: ASbGncti5k8YmYV/7rtj1tZmjfdc+e7qfxtQkPvGVdxtoxWwMYf8mkRudMFQlr22UDJ
	0c+dtm6SfLZBYJHHvPigHLS+/BDZjH5AAIvGIvqU66KUavjqktpoZurF1kcS5n4BOPr35OolR2c
	14I1T+NgFRlRqoEDcFL2yW8/8S4ovHZLdHOxJ1OfaEYUX2hFELmQmL+MpQ8rOEQocK3uXkSVG74
	biuvQOyyfUzOktJsxO+W47lMspdy2mqch+NIvz++hsrf6orRosPgfRJWI+++HHrC5iHC3Yhp+Oe
	SSFiF37NwJW760fxgjUaAL88a7McvxDG+DMPTXN7C9Z8381970cpWCy3/134zpE=
X-Google-Smtp-Source: AGHT+IH+z2bfJeFldTfIUQ1vbcD2anaS+bwA1NXDCxlSwUwYi4lfwisL9U5rWue8kaIlIPsq3gse7w==
X-Received: by 2002:a6b:4415:0:b0:867:17a6:9fd2 with SMTP id ca18e2360f4ac-8766c0ce0ebmr200635539f.9.1750823748666;
        Tue, 24 Jun 2025 20:55:48 -0700 (PDT)
Received: from ?IPV6:2601:282:d00:94b1::174? ([2601:282:d00:94b1::174])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-8762b5ee941sm342550139f.16.2025.06.24.20.55.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 20:55:47 -0700 (PDT)
Message-ID: <13d0d076-b234-4778-98a6-aa439a351788@gmail.com>
Date: Tue, 24 Jun 2025 21:55:44 -0600
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
 Adrian Hunter <adrian.hunter@intel.com>
Cc: Shawn Lin <shawn.lin@rock-chips.com>, regressions@lists.linux.dev,
 Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
 1108065@bugs.debian.org, stable@vger.kernel.org, net147@gmail.com
References: <aFW0ia8Jj4PQtFkS@eldamar.lan> <aFXCv50hth-mafOR@eldamar.lan>
 <004c6e95-7c1b-4a7f-ab68-1774ce5a51d7@rock-chips.com>
 <65400f7d-0bfc-4b0c-8edc-c00d3527c12b@intel.com>
 <aFtvlqPxO6eZkhfF@eldamar.lan>
Content-Language: en-US
From: Jeremy Lincicome <w0jrl1@gmail.com>
In-Reply-To: <aFtvlqPxO6eZkhfF@eldamar.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/24/25 21:40, Salvatore Bonaccorso wrote:
> Hi,
>
> On Tue, Jun 24, 2025 at 11:26:41AM +0300, Adrian Hunter wrote:
>> On 23/06/2025 12:13, Shawn Lin wrote:
>>> + Jonathan Liu
>>>
>>> 在 2025/06/21 星期六 4:21, Salvatore Bonaccorso 写道:
>>>> On Fri, Jun 20, 2025 at 09:20:41PM +0200, Salvatore Bonaccorso wrote:
>>>>> Hi
>>>>>
>>>>> In Debian we got a regression report booting on a Lenovo IdeaPad 1
>>>>> 15ADA7 dropping finally into the initramfs shell after updating from
>>>>> 6.12.30 to 6.12.32 with messages before dropping into the intiramfs
>>>>> shell:
>>>>>
>>>>> mmc1: mmc_select_hs400 failed, error -110
>>>>> mmc1: error -110 whilst initialising MMC card
>>>>>
>>>>> The original report is at https://bugs.debian.org/1107979 and the
>>>>> reporter tested as well kernel up to 6.15.3 which still fails to boot.
>>>>>
>>>>> Another similar report landed with after the same version update as
>>>>> https://bugs.debian.org/1107979 .
>>>>>
>>>>> I only see three commits touching drivers/mmc between
>>>>> 6.12.30..6.12.32:
>>>>>
>>>>> 28306c58daf8 ("mmc: sdhci: Disable SD card clock before changing parameters")
>>>>> 38828e0dc771 ("mmc: dw_mmc: add exynos7870 DW MMC support")
>>>>> 67bb2175095e ("mmc: host: Wait for Vdd to settle on card power off")
>>>>>
>>>>> I have found a potential similar issue reported in ArchLinux at
>>>>> https://bbs.archlinux.org/viewtopic.php?id=306024
>>>>>
>>>>> I have asked if we can get more information out of the boot, but maybe
>>>>> this regression report already rings  bell for you?
>>> Jonathan reported a similar failure regarding to hs400 on RK3399
>>> platform.
>>> https://lkml.org/lkml/2025/6/19/145
>>>
>>> Maybe you could try to revert :
>>> 28306c58daf8 ("mmc: sdhci: Disable SD card clock before changing parameters")
>> Given the number of other reports, probably best to revert
>> anyway.
> FTR, Jeremy Lincicome confirmed that reverting the commit fixes the
> issue for him as reported in Debian bug #1108065.

I confirm that reverting the commit fixes

Debian bug #1108065.

Tested-by: Jeremy Lincicome<w0jrl1@gmail.com>

