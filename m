Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E46757FC
	for <regressions@lists.linux.dev>; Sat, 30 Nov 2024 16:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732982426; cv=none; b=VpaB31SHVXrBDRmHVXftHtfLuIced/dgnl8Quk9eCueYbslSeIDr3P0gBvVmAR6cK1SQqfPm+lWC1q5PHrJ/kh9A37C7TR6BCWp+k3hfyZtKlHSNLJD+5GpCCabjWqLsbLC2if59xa/6R30vSfyAM3JAoJ+KlDboS5jq+2TFeJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732982426; c=relaxed/simple;
	bh=sVk+xK9OlSg6wVXyYOgSw4yWHPa2n+jrEqXIvAEe8t8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hnVxCfA/ULpZHnx6PUdc9eA7/qpN1ez4HyQ/Qw4+UxS20l17vE12mTBm/svedkCgqg+BPlII9+zyqUyBSwCryTk/5p9SP0q3x0jK/QGmnUPD88xtbSpmFN/qhJqxlfuZliGeWtTNrpAFceCU9sRbwbMcyp3Pu2dH+tr8GF6wI6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=Uyr82E/1; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="Uyr82E/1"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2eade1cad26so1961210a91.2
        for <regressions@lists.linux.dev>; Sat, 30 Nov 2024 08:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1732982423; x=1733587223; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fBp9IrYeZGmrlk+/+Z0GIb8sd46LxSapmHIVfvyatgc=;
        b=Uyr82E/1+HQnVo98PFe7At2jfVN/i+SmtnoBeW+wQXBF6et4jn0dqOYj/gFYSmVv+k
         SAiKayTlg9EKMXOD9isbfsOB4UOdFor4g3nLkSiDrTcetmTqKMHFbIE72yYhvcGqZGiM
         3H6yiG5Sz0ZrsnAhh50JvyM6nM/cdAnpxTggaSGkrWfH3O+foyvZY4olw2bOTbqRjCdH
         Pvl4LuzBmTgKQTlfXGkHE2VFzK34KkXoYP9B64B+HI7sUpOV9QHNAJ4PVNOCYNb2cuc9
         KylgaNQ7gdG6EEck93rM8Fs6tzhZrUJOxlpiJzU542y657qWPmqiNhm2UfdZT8BluA07
         BMzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732982423; x=1733587223;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fBp9IrYeZGmrlk+/+Z0GIb8sd46LxSapmHIVfvyatgc=;
        b=cpKiiV3WqCD7YMnNWqeIo6NXwC8AZ8HPgb8x5t0m1xVDL7N/Bv5A5qPMksiEYm9INa
         r93sPgxxgfATMt3GNUYMv7HrmWIVhB9m3Qn7gKwrq6nLjs+W0xw9BkVnujDtqRC/QyKq
         MYHaj26oArMqV9+Wg8eVjyQZ45CxY+TFsrse3OtMzT2VTlXlL1Gd8PBp2HzmGFo4JUEJ
         GrwAaWFIj9Mtl90QidD2IuPli/DyjhbWKsLCLi64FTUHcF4htDdyaRBnr0yEcxRUcKDb
         gg29zJeuK6MU+27TVbf03dGM7uH9wNQAcKhTILl9lRsMiYneAF3ANiDAgeuwSy+wqm/H
         MMsA==
X-Forwarded-Encrypted: i=1; AJvYcCUmkEO183wMYnUeI0VdkL8gNp+8+qOlK1Xy9ioiyayu9k4b0MbHmqXAOid2iIdd95tV5uzWSo3iU4R2qw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxd42nPIB284dXt7EeR2k7z67UbnHKvf/ffgqiRqm8a+UxOSoXl
	QvtibU4fsUqXUS1nKe7xEzQhpPP0RGW4bc1Eri06ARtk/ZzLNoX0dS9hOuhhQiF9Eu55tawiqKQ
	l
X-Gm-Gg: ASbGncv5yq7rVvVjW2XFbg5jc7qW+MPuLlrwQHpzEzKRHVp7tJEMvaTIPkJWUgYOBii
	VutefddLEcoNdkGvxIGT2xyrKytkbjskhsUFj6WExs/dZ/6MPSDUdm5vJXyQYy6dEzmfpOjBrp0
	2NRnSV+YnsI2n1NW1r6ctWE6fM3tLa9JH6evM3Ccg8mPgMVW2WVDvPwWVwCPHgsVtlbtnrdnNsW
	KjhbAAfgro5B519oJV+ZcA9c7s3GJEpQW9jt2vtkBrnZmY=
X-Google-Smtp-Source: AGHT+IG1gHPYs7dRx/9K/MKMozvZqss0Yzgyf9xmOJ+a9uwRem4JCoxPp54/uDhnsiyHbktTmr/V0Q==
X-Received: by 2002:a17:90b:4d01:b0:2ea:59e3:2d2e with SMTP id 98e67ed59e1d1-2ee08eb1144mr20727390a91.10.1732982422887;
        Sat, 30 Nov 2024 08:00:22 -0800 (PST)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ee0fa47ffbsm7135857a91.12.2024.11.30.08.00.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Nov 2024 08:00:21 -0800 (PST)
Message-ID: <09db95ba-b396-4734-9ff0-9331579c92b7@kernel.dk>
Date: Sat, 30 Nov 2024 09:00:20 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] ioprio performance hangs, bisected
To: David Wang <00107082@163.com>, chris.bainbridge@gmail.com
Cc: bvanassche@acm.org, hch@lst.de, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
 semen.protsenko@linaro.org
References: <CAP-bSRZehc2BxRC_z5MXKQ6qHNPXPgZoOQTtkiK_CFd494D_Fg@mail.gmail.com>
 <20241130060949.122381-1-00107082@163.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20241130060949.122381-1-00107082@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/29/24 11:09 PM, David Wang wrote:
> Would fix/revert reach 6.13-rc1? I think this regression has
> significant nagative impact on daily usage. From time to time,
> my system would *stuck* for seconds, sometimes even when
>  just `cat` some small file it would take seconds, and once,
> my desktop failed to resume from a suspend, I had to power cycle the system;
> Polling /proc/diskstats,  I noticed Block-IO read latency,
> delta(# of milliseconds spent reading)/delta(# of reads completed),
> is very high, ~200ms average, and frequently reaches 10s.
>  (Strangely block-io write latency seems normal.)
> My bisect also land on this commit, revert or apply this patch would
> fix it.
> 
> Kind of think that 6.13-rc1 would be very unpleseant to use without
> a fix/revert for this.

The pull including this fix has been sent off to Linus yesterday,
it should make -rc1.

-- 
Jens Axboe

