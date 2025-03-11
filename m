Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D945325DAE8
	for <regressions@lists.linux.dev>; Tue, 11 Mar 2025 15:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741705231; cv=none; b=bpViYsnbuIuc0FcEKIbuXi8ROfSzUSiWQPMErY8Ym2cy0I4t2SITcbljFP5znPvxTtlYB6maxyaMAQ7ojtwZloEoteNWMA1YCp3S6f2I+VsKNVtcxDyZQz+PUiOtlWyiT3jcDUPD96tZ6xOPphCnZ9noovpguMft/v0PLipX5so=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741705231; c=relaxed/simple;
	bh=vXvSVuV5bQhF3VLG2iUhLPtLfSzlkVdCIse4Udo9Qqc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e6GSz2UMVhBzbuEVKRn96EKkq5lmxGj/nvZUReuRtd3yAuCWKvJOpS5kwFhOviVX5twQbLH9thOfc9z4go3WmPsF5lecbBRLlx/TorRBSgbn5AUKrxOL5dNvUgDCDYDlaYx3JQLB21JTkuI16joyKVe4awnO25t2H0MtZ/gJqfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=oDw10vA6; arc=none smtp.client-ip=209.85.166.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="oDw10vA6"
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-3cfc8772469so17062345ab.3
        for <regressions@lists.linux.dev>; Tue, 11 Mar 2025 08:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1741705228; x=1742310028; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yAEFP7CPGRpGB6Ek/yG/+ONndvVAbW/tO0SLyNQeThQ=;
        b=oDw10vA6XC96EK70q9bOb8QsQ8inK+gi8gfFwCsgqrsBP5PN9LliV+VsNpn0xbcfyX
         4OBfYOsMU0VzqVG7e4XNhc49nZ9jFWAEmt8FsLIqvoLkDioO8VSo3UTl92Ko7PtPuH0u
         prGAJZHFn9OauDdekSgQQtojqpcA4bR2BL31PUujw7ZGnIIDDmEL3LqxOk0hLkS7/SXy
         8NsqNq8P8lcJ8IM14PtokLjRKA+zTnhAlVw8MMb40FY+2AJC6qfdtW2aMRllSE/zYNai
         e38+nOyLrgEC/c3hAVXIJ6daiNpAakYd0rTCwEfEJ1gpy7SLVKDmOeNp5tDGaZUbXyWs
         SEeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741705228; x=1742310028;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yAEFP7CPGRpGB6Ek/yG/+ONndvVAbW/tO0SLyNQeThQ=;
        b=taPRK78U+6U+QlHVeHbBoSDNJCVS2uCLu1KwyJ9ZeuG+hPRPrOK7FxpXmQCSHFDxmS
         h83TVaR2Qyws7fYa780zUyGw6Atrm9BsuXL4y/ELLSNTTRln0WgzdHJOj3HsEl6PaH2V
         CDi6BN1Fax+pA4c8sIIQKR9w0wNlx2eb6TrgUfIc/TN7STItdWKq3kLdxJ/Y75pZrUPW
         w9AVGHjHs7h8sSe6LXCTtbhq81M1rvbcmeAmS1oWz4T8cVAQUtJPRSBWtvLJaQE1IZWY
         z+LqnXNbgOLm40zPHf4kBUoCzMN3w7r9Lh7GElNxDdDDMm8HD6ZDH3aFlO2qhfeGMr0z
         9mGw==
X-Gm-Message-State: AOJu0YxUOTP1+f9DwDKoUBunVOPIlTWkauzcAVS9q0o5USuwnHeibQ6h
	TVlqVK+20PtmI6yHIhufQh14nSv+z7aOrlT/5JEoSB89FNiiyOAisjy4gLEs8em/Bc1JvV2jf4m
	z
X-Gm-Gg: ASbGncvRF8cMG/05OjVNzOsVsII/0kAHJPsBpJa8HW9hCv0EAI5YdDJ5bTxZ2k/5+ml
	pxEP5Ofe9O6Z7uLKxC6T2fBxCoG5miAamGeknXMcHUjVWmAapbKpFp5aexKSX96k4iS0PdQdy54
	ChLud7V9KsVkSU9SqX0FHUBwxbpCpYKb6yk7ImPZrI8h0wFlA9TzNNQOhM0katlMZMCqPKDtRMq
	qu6B8/EiI1VsgPU22gQj0HyXVdNJDRwFeVAnTPjZAlj/OIM9NYgwHUMyetvKQDvCp5IuXW3Gbv+
	6b5CHz04FHBCzc2goX43OZWWaTcRwBInG0l22itN
X-Google-Smtp-Source: AGHT+IHcxmWKlhT5BUMzUPM9EJYkbnyAI4b58WPXYjPQE+KohkFz2IdZ3dWWXwc9yjWqAMtIkD2flQ==
X-Received: by 2002:a05:6e02:378e:b0:3d3:fa64:c6ed with SMTP id e9e14a558f8ab-3d44196906cmr183046915ab.7.1741705227480;
        Tue, 11 Mar 2025 08:00:27 -0700 (PDT)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d46ef68116sm732055ab.40.2025.03.11.08.00.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Mar 2025 08:00:26 -0700 (PDT)
Message-ID: <625382fc-8503-4e19-b571-6245fb4d1317@kernel.dk>
Date: Tue, 11 Mar 2025 09:00:26 -0600
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] block: cleanup and fix batch completion adding conditions
To: Milan Broz <gmazyland@gmail.com>,
 Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 Ondrej Kozina <okozina@redhat.com>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 Alan Adamson <alan.adamson@oracle.com>
References: <20575f0a-656e-4bb3-9d82-dec6c7e3a35c@kernel.dk>
 <71bbd596-a3a0-4e37-baae-19f02c6997be@redhat.com>
 <459b9c3b-0d5e-4797-86f7-4237406608ff@kernel.dk>
 <535ff54b-5c49-42f0-af5f-020169b5da79@redhat.com>
 <d84313c6-3dd1-446d-910d-e7f9f2e7d53c@gmail.com>
 <3irisb67klhv2xu3w5digf2tavrbnn2umthcgkbgrpfs3effnd@f3btiynduuox>
 <cdc19799-fc72-4581-a942-adf411b19a94@gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <cdc19799-fc72-4581-a942-adf411b19a94@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 3/11/25 8:59 AM, Milan Broz wrote:
> On 3/11/25 4:03 AM, Shinichiro Kawasaki wrote:
>>
>> I created fix candidate patches to address the blktests nvme/039 failure [1].
>> This may work for the failures Ondrej and Milan observe too, hopefully.
> 
> Hi,
> 
> I quickly tried to run the test with todays' mainline git and mentioned two patches:
>   https://lkml.kernel.org/linux-block/20250311024144.1762333-2-shinichiro.kawasaki@wdc.com/
>   https://lkml.kernel.org/linux-block/20250311024144.1762333-3-shinichiro.kawasaki@wdc.com/
> and it looks like our SED Opal tests are fixed, no errors or warnings, thanks!
> 
>> Jens, Alan, could you take a look in the patches and see if they make sense?
> 
> Please, fix it before the 6.14 final, this could cause serious data corruption, at least
> on systems using SED Opal drives.

Fix is already queued up.

-- 
Jens Axboe

