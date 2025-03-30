Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29361DD9AD
	for <regressions@lists.linux.dev>; Sun, 30 Mar 2025 17:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743354282; cv=none; b=Gv6EMxGXJdi9k1kcx+mbAdG3i76fJRpyqD25s7yUFI07ci+s6WlaLtWZVEM4UlclbWSzw7vRB/BwtaDV6x5vXhm/G87oa3WnZzGTmFMHzsWEvHlIP0toxbjN7yF3ztrSI1VCQCvpKRRPmHeQfQZ+0DblFw1Urz44ei0GgR3BrJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743354282; c=relaxed/simple;
	bh=BAKEzZA40sOcQ7n1AVHKwLRUlfebLm+j0ppIiCYiXFo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kdPpEuz0Mog3JWQY/odw0Uc3efL8mQhjJ4yRSwM1FMnZAd43Kb9jY6np3QEzGYQMCLPTcGM+3DrzFIk4+tGbr77PPpsyre4xm/LNTQJ0bY5lQFhEwvfu9ypPyJjyKnbOuSKUzu5INZDEV3RzQHcLKsOL6MRgUGdRcv6B9tsGJn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fyei/oLX; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fyei/oLX"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso36140445e9.1
        for <regressions@lists.linux.dev>; Sun, 30 Mar 2025 10:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743354279; x=1743959079; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2t8U1apyWfkYadxNh+ZCNH1xZAalJJ/Z/eiVcfGrYbI=;
        b=fyei/oLXDG5bSu+jaQ+SCLhSV1I0nXB/1BoHBWLdz81yGHgSsojJ+ELl7x+hDcMiAV
         UuPjYj7Pgkp2QiN3B/7nejgU0WoAlzadEf7NaAlszwhBQXyICyDuxynl5/y1e1zpfL24
         9wta8Mja5vl4u4El0dWP6s9XfRZ47RCMdMWE1M2MGQBFueNEuO/PjKF8+dlfisdK57Ho
         yrzllO1CBcangFcNpqIrto7EIxNaUexth3vRO0ytY75bKg6WMpjuSxFByemcYjPuIwc4
         oSdU18UXoc43SvjbOMd1dnt+WvyNtQ+sJtCyjShsJzKxEwavaM16js1yYk9kvCLoO1p7
         b8qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743354279; x=1743959079;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2t8U1apyWfkYadxNh+ZCNH1xZAalJJ/Z/eiVcfGrYbI=;
        b=g1JMDCBh/XQ+d8AQ268NbsDYzWUTQQzITUwFuPFUSfsGKPauMLpwCrZ/qjtj/QFdYM
         2n+DXGCtlKnNz84OrSefw5rpppX6ddy3ielgbuR1eMeNsT8Uk98UV3xwJ2PNKAfT36Ob
         7X/V4vYhmJih1Oou0waQC7JJgTcANuN7lt5Hhz+Sg1qhFV3lHiqW0Auk9BjWa5Ko7Rc2
         KokT8Sv8Qgmey5AOyzgNE6hl/gtx5WDuDWzeBiFefWUWg8fB7t8GzBL0sUyT5uXbTv26
         ECtBK4NSoGzv/JELiBXLzKq+j8kE7Pm+yXQKEVFBvREcIPNp/KyizQQT89UIIe8zB0uH
         Uraw==
X-Forwarded-Encrypted: i=1; AJvYcCURGIJvEEaFsbM/aNFksJzIO9AP8mwIV1LE0fWu/995/nSK3oF9dZiPKhXkTcEHutkgCEgqKy7H1we+BA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxkOGOGgStbHAKgNJy31LU6Ja28KdusjVpV9GCS75zF6Tjcl5A1
	BMFCDRgRX+I+OSKcBXaCtq2LNKCmnQM3L0Gw7n8YaRA4+0XPh1GR
X-Gm-Gg: ASbGnctahSz3Nmm/nOA9orXjGIxbnmyYOrUELzvRmDdL1ngZc0jC4C51OrURY3x2c+/
	8mVW76vYCubbeiDMwJTL9CjeIdSzz/ht65VuSWfF5TZq1QNnR5g+KObj36EEqQLYamBpFMpGd83
	8R7ub44skUIVmEioLe8GHS0W/7bd6SYBQV51GgXSjM5811c/zsRetWXAXsiSogUdYeotPofcmj3
	P+V6LXInkfWD5DS/LmcweU57GI4UQq7k85sZmzDQA7373DsIVD1OgrXWqRa8xVECIFrABJVgXGm
	1cQRjldkT61bw7oLytDzl0vg3WW6unhcS0jVlr4k4rTFGRzyDT04D37Euil4xfLsSe6WzHoYSTT
	DrsLJzPxFZCjKIVNCMjmrvEf+5S0=
X-Google-Smtp-Source: AGHT+IGWRHzVCWEmkKNQbY3li1FH4smSEgKYfZNlQnBS52KWB4DBmN6gENIyoIOkvQziVGmRka0Rjg==
X-Received: by 2002:a05:600c:34d3:b0:439:9424:1b70 with SMTP id 5b1f17b1804b1-43db8526487mr69463315e9.30.1743354278683;
        Sun, 30 Mar 2025 10:04:38 -0700 (PDT)
Received: from [192.168.10.195] (net-188-216-175-96.cust.vodafonedsl.it. [188.216.175.96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d830f59d0sm138759595e9.28.2025.03.30.10.04.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Mar 2025 10:04:38 -0700 (PDT)
Message-ID: <4537905b-a1bb-4597-ad25-17f95ecd3b1d@gmail.com>
Date: Sun, 30 Mar 2025 19:04:37 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Regression: mt7921e unable to change power state from d3cold to
 d0 - 6.12.x broken, past LTS 6.6.x works
To: Greg KH <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, Linux Regressions <regressions@lists.linux.dev>
References: <415e7c31-1e8d-499b-911e-33569c29ebe0@gmail.com>
 <2025031923-rocklike-unbitten-9e90@gregkh>
Content-Language: en-US, it-IT
From: Sergio Callegari <sergio.callegari@gmail.com>
In-Reply-To: <2025031923-rocklike-unbitten-9e90@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 20/03/2025 00:54, Greg KH wrote:
> On Wed, Mar 19, 2025 at 08:38:52PM +0100, Sergio Callegari wrote:
>> There is a nasty regression wrt mt7921e in the last LTS series (6.12). If
>> your computer crashes or fails to get out of hibernation, then at the next
>> boot the mt7921e wifi does not work, with dmesg reporting that it is unable
>> to change power state from d3cold to d0.
>>
>> The issue is nasty, because rebooting won't help.
> 
> Can you do a 'git bisect' to track down the issue?  Also, maybe letting
> the network driver authors know about this would be good.

Bisecting is extra painful, because the issue seems to systematically 
happen only when freezing on restore from hibernation, which in turn 
seems to happen only when I get in hibernation through the 
suspend-then-hibernate path. Because this is my main machine, I need to 
desperately try to avoid these freezes/crashes, since I am afraid of 
data loss (I have already broken a filesystem once this way, and I don't 
want to repeat the experience).

However, in the meantime I have found confirmation for the issue. See:

- https://bbs.archlinux.org/viewtopic.php?id=301985
- https://forum.manjaro.org/t/wi-fi-mt7921e-stopped-working/175867

I would not totally trust the second link where it says that 6.12.4 was OK.

The general wisdom seems to be that with recent kernels you need to 
disable ASPM for mt7921e. Now I wonder if 6.6 was maybe not activating 
aspm for that device...

There is also:

- https://bugs.launchpad.net/ubuntu/+source/linux/+bug/2059744

 From which I get that the problem was already present in 6.8 and that, 
removing the mt7921e kernel module before shutdown and suspend may work 
around the issue.

Sergio




> 
> thanks,
> 
> greg k-h

