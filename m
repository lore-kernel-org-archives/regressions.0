Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52BA834B433
	for <regressions@lists.linux.dev>; Thu, 23 Oct 2025 19:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761246706; cv=none; b=t6b73M9gpGSjdAWETZqUSLHqTimg0geijQO90DPP8A0VpHfyOMP9pI9i0cvkrEeRIm1X0L55n7Yxr8VG8AP6lOs5gIkrMUGts2/AsOPtN2hFP+HIl6AilEZ22z3cns8eqPh+XjQFwgk6PJh4Jj/Z7D3snkYgHYsgEwOeIDg7SWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761246706; c=relaxed/simple;
	bh=pttWRU7/dgK2UjwSiWEkHrJdOEDz6wX/zKzFjPVx6ow=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lYnrLVNGWbtkpv6G5hapsFZSjqEk3wjQJFtQwQUDoCHWUjYZxcmJW6eMqgbfDw5QTlmSiC8E/spEsPwVmWuKIGuMyqzSZrpGgki2WRT6M3bvfQROwmbVXPpL6xauZrRm9dRqxii+aaV/1mu9c6BUmwGkYwUWdZ6yO4s7nAwl2oE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=YeP0rI1G; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="YeP0rI1G"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47103b6058fso8826625e9.1
        for <regressions@lists.linux.dev>; Thu, 23 Oct 2025 12:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1761246703; x=1761851503; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YC021s3hSX0b6kL+FC7sXtMbVcQNzXKMZzcCBREO6dA=;
        b=YeP0rI1Gf4U3ixnMmtUL0Mu0VmL1VgCGsCqX4xQyx7fsFXbUABDPB0OMyOW+p4w+Cn
         lsS4cNQij/UJCcX7Tuc+cPEu2ltoH6Kg0lxM19czxAxuekt8jXKI59F4GrgFsGS5l067
         mYRG/NxIOCSglXHAkMLAyhNA5rlaQSGwb/OpEnQ6NDvYHBErp3Iy1s/nocqzdNMw+vdQ
         Nq7JdVhrv4ymbCREjyYSbe9Kb+JmtTokjosnRGnftwmgdiR90PwH5gXa2RkDdpvLXhiq
         j9TWmHLbwEHsFQZK19UR2LsA5JoGAE1DKcxMm+VBcPaeFAKUXG70NrkkxIc1tQyTa9lV
         tAcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761246703; x=1761851503;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YC021s3hSX0b6kL+FC7sXtMbVcQNzXKMZzcCBREO6dA=;
        b=XLQ6eD8zKcJE+PgUjH4HafIXZMBAXC6b7qEZ7MoHJXMutIRWoYFFTtnn7a6oRc8H2t
         R9aJvwKJvuswwUZ/3yC3LAD5XoCupKl/4vK6tDWEDaG44BQGxNoLX4BZkZhBy0g8Z5DG
         whKDyRraHntLEZEg0XzP9lHtqbQxwojOPZRU076xFKXpGPpW7iNPclUI3pK8TZip5hdb
         /j6nkjXdxmtMWTW1UhQV46TbRL1iklm68nvogakGbG2/v9Gb61ES7sBS0BR6QWWkSlKh
         CiVAgOLhTet6qtCPkb6W4lU7cLVjnL/WNXckOkV2pMDxz8f4VRLU3xoi4IuBdS6tf81q
         +URw==
X-Forwarded-Encrypted: i=1; AJvYcCXtfQHQFmyKLUXDAN4MNK4hqw1WLZFbYMhg57ovEly00bKEyIsxF90c5P52C67Q/Wgb/Et2UwG5XPHu1Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YzMXILejfd3AFCT7h7V6qKLOwXe/v92vbGpjwgrjEweXjwraOMs
	Zjvw3cht2jcOobha66aF9lNGF81oeqvLkuB1SeazdPk2mSczaRSZO0c=
X-Gm-Gg: ASbGncvmkVs+AU16JQTjf/K0t7q1OQda/9d3Wgk2/g7D7sA0gEbHmIDSFc0H1XmUvoV
	U3dT4sfCtqoXxh5Pv4hZH445e1J038EDfgJfWK420uzPxGtsTvsw1g6zvCmq8CFxQe+1HtxU/or
	hRrgKrV3WtB/PtjvjkLojnbWTGgJGc2FBQSs1lbnxgJYbC08wSPjnNmEWJ2eVwVZkqKoGyytxia
	L271SJYom7/OSrc4SkFp5EXXzXcW9HOxVTLkkvEvSk8C3sqL0fOAxVl7SrRzUsfgDaKvFTNc793
	+K17csIYe6vw3rh/lulDwh5W20iW+Thn18V7RsQo9gN3LUvqgDpFuqYY9UOtlJO47fonZAMu/pW
	ZI/ANqjhdlNt8zDWcLgdF0enX8zHoOKs6e3t/kKsFvJxyrsGpqcqlmySWWv8l0OgBXwoVveOqLe
	OSd3z2Pj2VTEslrNlOFlna4hcSQBAawq3iY6d/Av2KcNMP3RcaqXFh5tdyu6uopRo=
X-Google-Smtp-Source: AGHT+IFNsNEq2TdqKr0cvqPqFFbm5Iwue3LIAxDBLdoZa+wyAY95ssAJ4sXZtAPUqqOIfIkrYHRO3Q==
X-Received: by 2002:a05:600c:c3:b0:46f:cdfe:cd39 with SMTP id 5b1f17b1804b1-475c6f69890mr34045225e9.16.1761246702297;
        Thu, 23 Oct 2025 12:11:42 -0700 (PDT)
Received: from [192.168.1.3] (p5b2b4069.dip0.t-ipconnect.de. [91.43.64.105])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475caf15b10sm60824215e9.11.2025.10.23.12.11.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 12:11:41 -0700 (PDT)
Message-ID: <270ce9a3-5067-4ef8-9205-414b5667cf3a@googlemail.com>
Date: Thu, 23 Oct 2025 21:11:41 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [REGRESSION][BISECTED] Screen goes blank with ASpeed AST2300 in
 6.18-rc2
To: Thomas Zimmermann <tzimmermann@suse.de>, regressions@lists.linux.dev,
 LKML <linux-kernel@vger.kernel.org>
Cc: dri-devel@lists.freedesktop.org, stable@vger.kernel.org,
 jfalempe@redhat.com, airlied@redhat.com, dianders@chromium.org,
 nbowler@draconx.ca, Linus Torvalds <torvalds@linux-foundation.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thorsten Leemhuis <regressions@leemhuis.info>
References: <20251014084743.18242-1-tzimmermann@suse.de>
 <a40caf8e-58ad-4f9c-af7f-54f6f69c29bb@googlemail.com>
 <43992c88-3a3a-4855-9f46-27a7e5fdec2e@suse.de>
 <798ba37a-41d0-4953-b8f5-8fe6c00f8dd3@googlemail.com>
 <bf827c5c-c4dd-46f1-962d-3a8e2a0a7fdf@suse.de>
 <5f8fba3b-2ee1-4a02-9b41-e6e1de1a507a@googlemail.com>
 <e2462c92-4049-486b-92d7-e78aaec4b05d@suse.de>
 <3ca10b2e-fb9c-4495-9219-5e8537314751@googlemail.com>
 <329a9f97-dd66-49c2-bc42-470566d01539@suse.de>
Content-Language: de-DE
From: Peter Schneider <pschneider1968@googlemail.com>
In-Reply-To: <329a9f97-dd66-49c2-bc42-470566d01539@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Thomas,

Am 23.10.2025 um 14:46 schrieb Thomas Zimmermann:
[...]
> I've been able to reproduce the problem with an AST2300 test system. The attached patch fixes the problem for me. Can 
> you please test and report on the results?

Great! - this patch on top of 6.18-rc2 fixes the issue for me, too. Thanks very much for your effort!

Tested-by: Peter Schneider <pschneider1968@googlemail.com>

Beste Grüße,
Peter Schneider

-- 
Climb the mountain not to plant your flag, but to embrace the challenge,
enjoy the air and behold the view. Climb it so you can see the world,
not so the world can see you.                    -- David McCullough Jr.

OpenPGP:  0xA3828BD796CCE11A8CADE8866E3A92C92C3FF244
Download: https://www.peters-netzplatz.de/download/pschneider1968_pub.asc
https://keys.mailvelope.com/pks/lookup?op=get&search=pschneider1968@googlemail.com
https://keys.mailvelope.com/pks/lookup?op=get&search=pschneider1968@gmail.com
