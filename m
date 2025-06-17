Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2916B2E2674
	for <regressions@lists.linux.dev>; Tue, 17 Jun 2025 13:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750167843; cv=none; b=bTjjuRg5mLSExbK5efuU2sTf35bRx0l80hmvg7tRpQkawKgbOEbvRyEFJlw0QomWAUWUqIwbNW6UsyFnc/NWRGiwxhrz89S9kT+3/EZYh2N5EKVwRAZMohcKAgCiWdBPp/0qQWxEjh256+1+n3UCJ9KE8iLmAWYJbubgSS+2I+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750167843; c=relaxed/simple;
	bh=BFQ9SO2t1J71+CICyMv1OPoOaaKRRkwWmkwVe0QJxP0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HP2jOUxVeMHgeNc2ey9T4GlrhSiLC6lWmgSbhUkHdepjgwym47TS/wsxP0Sz5s6BItdxt0HAT+bgOONxK/3cA1lNymFg0dBy4JXHiMd8muc+hySqUMsSTp5sC24J/6S5N0S8zBydRwJGVPSE3jiC7u1wDjr4dsPumJF3zqaZYZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aSNMXqNS; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aSNMXqNS"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-607434e1821so8281987a12.0
        for <regressions@lists.linux.dev>; Tue, 17 Jun 2025 06:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750167840; x=1750772640; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zecGBL4EFfqvJ1+S5Ps/tbhcKJ3SUOGOERPfVCGUV9U=;
        b=aSNMXqNSR+M89z5//Zfaya8oP/7VGoJjuPoNB5iTymR8u+pc4boa44O7ZDmUFFhpJs
         3C+nQqVeO4/btFalJWbeBbrL2KW2JN10/nrqyAwZwCoYME6XL9h7EBJRkwHI7imOT7Lr
         1CfeG4hr6Xgg5vjMYW3TVhVg3MxSZTjyDbdrWiOht3+jbGEIs2DkLUsS78+8qjwVOnQk
         Rgm42+CBCtTDtItr7JUnroce/vdUsOIRSAWGtmrlvY71M3Zu6qHqEn497DVL6KmuNVNe
         a4dfrIKLFhAB7u/W9KFMa6CL5ZhvQPmn6zKNuvL0IedZVLKJBSrSFdyxJunqK+lXfWDp
         ON4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750167840; x=1750772640;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zecGBL4EFfqvJ1+S5Ps/tbhcKJ3SUOGOERPfVCGUV9U=;
        b=O/G6pFD7D0OQgdzQ+WSxTzKlWPIr4bN3G36MY+aZv8azLzQNPds1VFJw0qfyOx+Ob/
         wIasclV7Fo0Q+xiXK68VNR5kldFOpSU2OfIcUBaDb+c8QFY8X4rWX/b8qG9FJrvWJAcp
         nFTiE38vFWYzEurpevqyLKgPo61bx8RmOnMiS41KVlmqBh5xh7/+1/x8AyMS9naHRq37
         3Delx71THmBgDu/2SCerM0bsYvP7NwVXQUXGC9XL89rnywiB2fYIqZUqGWcSLElGqfQz
         Ha5PJ5/udnC967nYbaDp6g/pjBMB+4Kfg+8YWdNyxGzfeb7QlpV6spOyRwrLvZR9hwEd
         ReMw==
X-Gm-Message-State: AOJu0YzEZfeGAXFFahBOskvDECOCKBB/m1ySqvOpRItN5gKLOB7yd02i
	g6pkpQhG3YJN62kIFMwB560BOfSpeQPigc7BZDWPMQzZswZNR3VhTrz3DhbV/WWJ
X-Gm-Gg: ASbGnctHHcJLswHkj0ez6+UOpRO0APtqorisjbLwSwnxXd6rKUJ6foxBhV6fitjnEkf
	86sH/oRGz4/PjD6hyFNrAzAO1Yyx3foqUqI7DVCrkHlFSUhQm4IDlsBQBXa2035wljgo82EAz6u
	3C35qWn5SaGdxHO/cJPCp6+HHup64/9ss4/VfHohrpVUkI8C6l1snndQUzIT4+ZE4+ETtAj2Adf
	sXkxzfDLVFg71rwCFhnN/7/+rq0D6UYp6CdluTNoWzTGnXAaGFBPzFn5eBDe0f5nSsDONqOrNbp
	RtjqG8G17UMWBpKYsIOZTo3t8rXkJjOsrlW7Xx5YbadXxp1d9BWAeMk+uME7xF9/+OKTUMS6poQ
	gI1cBoT3NDltl/59KRBUknhCzy4Z1BzjW+aQhORmhbf6u
X-Google-Smtp-Source: AGHT+IGgIlcS/PryJ7lnGbffSNLneJYZk5+uA1B/WOdMk8Ma6F8q8Mlo7t8zz4EebhjQz/a0cLH/aA==
X-Received: by 2002:a17:906:478d:b0:ad8:9b5d:2c1b with SMTP id a640c23a62f3a-adfad29dd5bmr1181198766b.9.1750167840364;
        Tue, 17 Jun 2025 06:44:00 -0700 (PDT)
Received: from [192.168.75.93] (217-122-252-220.cable.dynamic.v4.ziggo.nl. [217.122.252.220])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-adec81bb9cesm864213666b.49.2025.06.17.06.43.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 06:44:00 -0700 (PDT)
Message-ID: <33046593-17e3-4bdc-9d4a-94dc94ef5e81@gmail.com>
Date: Tue, 17 Jun 2025 15:43:59 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION][BISECTED] intel iGPU with HDMI PLL stopped working
 at 1080p@120Hz 1efd5384
To: Jani Nikula <jani.nikula@intel.com>, stable@vger.kernel.org
Cc: regressions@lists.linux.dev, Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>,
 Khaled Almahallawy <khaled.almahallawy@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gfx@lists.freedesktop.org,
 Christian Heusel <christian@heusel.eu>
References: <8d7c7958-9558-4c8a-a81a-e9310f2d8852@gmail.com>
 <afa8a7b2ced71e77655fb54f49b702c71506017d@intel.com>
Content-Language: nl-NL, en-US
From: Vas Novikov <vasya.novikov@gmail.com>
Autocrypt: addr=vasya.novikov@gmail.com; keydata=
 xjMEYrX2ChYJKwYBBAHaRw8BAQdAf/bzdTDerOW5j+qrayMzPOCKthCx8KYKZo20cty68aPN
 KFZhc2lsaSBOb3Zpa292IDx2YXN5YS5ub3Zpa292QGdtYWlsLmNvbT7CjwQTFggANxYhBLKE
 QxE9sGxECbI4ubmfrsbg1d9tBQJitfYKBQkJZgGAAhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQ
 uZ+uxuDV321klwEAm5+HyBecp+ofMZ6Ors+OvrETLFQU2B9wCd/d/i2NjJABAIssTvgdxlqF
 I6GjehRMPURi6W1uFMPzzp9gM1yeYXEGzjgEYrX2ChIKKwYBBAGXVQEFAQEHQODm5qV0UQrP
 hcJkaZVbhtVmb90gN6rIuN0Q/xTmhqJ4AwEIB8J+BBgWCAAmFiEEsoRDET2wbEQJsji5uZ+u
 xuDV320FAmK19goFCQlmAYACGwwACgkQuZ+uxuDV322trQEA1Yj4GvOlEPfyuhMfX8P0Ah/8
 QXCqgdMQH7PaNgIFFokA/1DgWcc1XGFNRHpOGrJNnF4Ese1hWjYoqo2iBlURPQwP
In-Reply-To: <afa8a7b2ced71e77655fb54f49b702c71506017d@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jani and everyone,

On 17/06/2025 12.33, Jani Nikula wrote:
> Does [1] help?

The patch works. (Applied on top of 6.16.0-rc2-1.1-mainline, built by 
Christian @gromit who helped again.)

The patch (or the new kernel) also have a side effect of xrandr allowing 
a completely new refresh rate, ~144Hz. This new refresh also seems to 
work (I cannot easily disambiguate 144 versus 120, but I can tell it's 
not 60Hz). So as far as my hardware is concerned, this patch leaves the 
whole system working in all scenarios that I've tested.

Thanks!


Kind regards,
Vas
