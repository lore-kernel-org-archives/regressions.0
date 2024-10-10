Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D121C9ED3
	for <regressions@lists.linux.dev>; Thu, 10 Oct 2024 13:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728568213; cv=none; b=FExbgeL7449dNQKde/2FyodiDW4krZVHd1gBxZhWMGYGjI1lc7sdoWDwfWuDLWRo+Bb+uHiSJR9Mc1JCvh+mZXtpULbuNVfnYStR5c3xTcTD9PxWc4fYpLCoGrkSiqy1HOyeHkfKqOr3vqTCjQA3jtgWHgNI0At7GSbcKFOMVyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728568213; c=relaxed/simple;
	bh=vXSpa8/ztwFdblYzjZfPeAy65gA/yhbEbIjjTnCiBrc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CO9hE4NvXmHUVgJnxfRg8QF55JnyPfKk6rF2/WPyrKLtb2DBby3u7T+/BVhS9o2zUpsinffx677gUvle5ggcNfW8OGRu/kbc9RGPUlaHTUHIC9tsU2STO0WtYWhUllUYgbS3X4d2pRRmG9vpZHkMm9JMIphwmyRaaLVwO2w3fqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=ff511lwT; arc=none smtp.client-ip=209.85.166.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="ff511lwT"
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-8354406f92cso50227239f.0
        for <regressions@lists.linux.dev>; Thu, 10 Oct 2024 06:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1728568211; x=1729173011; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lExNIi51K2j3D8nATL62y18ayPUOjQ1BwEMnlcOF0zo=;
        b=ff511lwTuFWf4oyvHS9thLTBWJsf1ozKEJo5GNPzcwURdYfUWYWdgDnm4cwYuw55cX
         5IVqW1NV/E+1Ng00Wkse8e8k0BXyGHGxzvmswv7emvSMpS7iKlbBn5484uACiY4uNizz
         +kMveSPya7MR9bK4l4tZD0P/soOFEssKHq4kgAl/arsf0KHWkmrx2z8qPLi7zmT/lOhI
         sZodZ7AaAr+cwFIybqe0GgXjqrUaLxLlTm7pB13XvpoTZ+2rN5jp0KxDlWLaL1Smh/YT
         5CL7DmnfFYG2fbOBYz3nlfC5QzeSnWvBtusckn9uUBeHLFGuEBO4YUkGhUsia3C2/Zha
         Y/3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728568211; x=1729173011;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lExNIi51K2j3D8nATL62y18ayPUOjQ1BwEMnlcOF0zo=;
        b=UjznkZaikc60TrEsYZcprM6bJRF3xKhPdv6f9VOIklj69IKTjAHebHu0FILVrX2bO7
         vyhVa9IScBDw49JlaCUcQJ67GfzI9caIDLUGLXXaAW+l5zI8/4h4kuHulc5ylOjqeb/w
         Be2+rhWlkODuL5cXKmwC6wXGpx9yyEam2ngPDRLH6dyHLJej5ygNi4ySXzHtsn+g51eQ
         L9auLPEg3VxQJBEb+cvMQLZv6Ia1UP8Vt66oTjEPzEX55GLmI0eoewIwRYxK117meIMg
         2zu9T/e0MXqxXKn8yvAuJr6Q6dos31yoXOl8boQyNoUnBVwdZwq9K2pz+scDqUE/s+z/
         WLVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJ00XyXoFKlu1/qrpr9xK3/nVMb4U4JNgJfpaMOvaUMlODO/ye8mT7MXSbW+AIrMRomcNK7iAhucRtgg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzTyKMEKreEEaJCGP7I4Bm9oeg+4O/wHqJAGWp8kj0i4bQTkDKO
	lDJeecYAKdG14gIyX2RaE4zp6Ja0cPbdYAOGBjMkIsCrZbOdSgJQRxNikRjCbtAX+vnKX2PkmF1
	WRCg=
X-Google-Smtp-Source: AGHT+IEeR69NBR8oq0nQoLaOvleeI8vQnB6Q/r7lACE3lrve2GJIB5H29drPuLqYyHSLZ0XLqozqOQ==
X-Received: by 2002:a05:6e02:3dc2:b0:39d:3c87:1435 with SMTP id e9e14a558f8ab-3a3a709de06mr24168715ab.1.1728568210945;
        Thu, 10 Oct 2024 06:50:10 -0700 (PDT)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4dbad9b0e90sm246561173.15.2024.10.10.06.50.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Oct 2024 06:50:10 -0700 (PDT)
Message-ID: <842a76fe-3d6a-4846-83da-bb113634b8bc@kernel.dk>
Date: Thu, 10 Oct 2024 07:50:09 -0600
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: AMD zen microcode updates breaks boot
To: Borislav Petkov <bp@alien8.de>
Cc: Thomas Gleixner <tglx@linutronix.de>,
 the arch/x86 maintainers <x86@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <91194406-3fdf-4e38-9838-d334af538f74@kernel.dk>
 <20240928061038.GAZved3hMSU3XahWrJ@fat_crate.local>
 <5fe1e264-c285-4988-b1e3-46771d07172b@kernel.dk>
 <20240930044313.GAZvosYZF5mHi2OZbC@fat_crate.local>
 <d7aff674-ad92-4a36-9ebf-8d3c42774723@kernel.dk>
 <CC418B80-5ED9-4F64-917F-BA6F94130F83@alien8.de>
 <ad9638b4-0a4a-4cd0-9fcb-2690693da157@kernel.dk>
 <20241009091247.GCZwZJDwFETmN5pEGe@fat_crate.local>
 <77f16324-47e1-41e6-a9e9-2cb7cbc8d14d@kernel.dk>
 <20241010134613.GDZwfapaZ8AKp0n72C@fat_crate.local>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20241010134613.GDZwfapaZ8AKp0n72C@fat_crate.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/10/24 7:46 AM, Borislav Petkov wrote:
> On Wed, Oct 09, 2024 at 05:04:23AM -0600, Jens Axboe wrote:
>> Yep, 0xaa00215
> 
> Found something: I'm not handling the stepping properly, below is a big diff
> along with debug printks. Can you pls run it and send me dmesg. I'm assuming
> the box will boot with it.

Sure will give it a spin. The box is tied up with testing for now, but
I should be able to run this later today and send you the output.

-- 
Jens Axboe

