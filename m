Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDFD53D96D
	for <regressions@lists.linux.dev>; Tue,  5 Dec 2023 09:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e0BG784U"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-40c09f5a7cfso23877415e9.0
        for <regressions@lists.linux.dev>; Tue, 05 Dec 2023 01:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701767107; x=1702371907; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EB/Y92v0I9IkLUdwFZ6UBLMNAao4UX9xJXV50Zdq6Ao=;
        b=e0BG784U9O7+/JZnEbkqQko12XKx3NEZZgBnGG4xUUi58ZVJMg+oY+hixoFa3mGoY7
         bDhulHkuUS+ZkMUwQ6q9/CczWIHySSybf/aukO9WSjuMlRh1qD/90EHbZlOoXWMulPCE
         vRz2C1F7qY9Fh8Hj0+eq32IkLMtute2Z8i2X6IY+tDpUjmqxevQduo5xSBK6YJtpu+uW
         sNAwEhFHmnyzVl4fcR1I/Dh+SQeh84aRrWi9DFKGhAnqkf/5pnZZxYJFQIR1RiAOCsZ+
         ecKvGuGafem/wHKedx3eKyqrup0aT0bwUwSYwAQugtR2ixS5y9HxKuwbReBZaqq2lFfo
         menA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701767107; x=1702371907;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EB/Y92v0I9IkLUdwFZ6UBLMNAao4UX9xJXV50Zdq6Ao=;
        b=gEhzbOPlfWnxgfmhveYv4DkHBTHAMdyUOR+QRIe2jrImgxhOScExDI25FGsxsiATz/
         ZS0uzUaZ86pVzw3ns/mX+tC+OAFOsL87iEdBMLwJJBZGGyrShB5ua/xWEYtJ492PQMgP
         RRUqfmHTmzCZyD0O8Loi8V/bF2ZYmtacIYqPhZ1nMGQJgrq9p5HUNq93giJj4+amNAZd
         AAttJq9oknVamaXHDcjd1yWzqk+vTbzFKXc0ii5PVo0s4j1DCXS5+YJW4rXKMIKwSOql
         QuODHYK/LdXD/odIZUtJ9UR+mHGQs3mH+J3vjVp6N+O6QHQuRXo8qyeBg2gS5PkudI9o
         SF5w==
X-Gm-Message-State: AOJu0YxV9OfPzsmKqhYTHBXHIXyD7iisa5KbJfB+J+qY22U2DNSGnrTd
	yw9yMC45GHnAfKaXv387Pxd4kQ==
X-Google-Smtp-Source: AGHT+IHzbXwr5ME5OwjDJBGKBmy57k08KuhAPRUBnAvT+jiYCDRow0jaZ3wtgDJkcfuVRBvshGgQlA==
X-Received: by 2002:a05:600c:25cc:b0:40b:5e59:e9f3 with SMTP id 12-20020a05600c25cc00b0040b5e59e9f3mr253482wml.146.1701767107112;
        Tue, 05 Dec 2023 01:05:07 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id m8-20020a05600c4f4800b0040b37f107c4sm17991122wmq.16.2023.12.05.01.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 01:05:06 -0800 (PST)
Date: Tue, 5 Dec 2023 12:05:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Maxime Ripard <mripard@kernel.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>, kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	lkft-triage@lists.linaro.org, regressions@lists.linux.dev,
	davidgow@google.com, maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
	Linux Kernel Functional Testing <lkft@linaro.org>
Subject: Re: Kunit drm_test_check_plane_state: EXPECTATION FAILED at
 drivers/gpu/drm/tests/drm_plane_helper_test.c:123
Message-ID: <42d85b15-9ffd-4a08-b51e-a3367e57d128@suswa.mountain>
References: <20231204173536.51003-1-naresh.kamboju@linaro.org>
 <rxv7jlfuwjib443pzdepbtgu454gdzemd3ojmmhbnhr4syneve@6me3bduyx2ee>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <rxv7jlfuwjib443pzdepbtgu454gdzemd3ojmmhbnhr4syneve@6me3bduyx2ee>

On Tue, Dec 05, 2023 at 09:37:05AM +0100, Maxime Ripard wrote:
> Hi Naresh,
> 
> Thanks for the report
> 
> On Mon, Dec 04, 2023 at 11:05:36PM +0530, Naresh Kamboju wrote:
> > The Kunit drm_plane_helper failed on all devices running Linux next-20231204
> > 
> > ## Test Regressions (compared to next-20231201)
> > * qemu-armv7, kunit and
> > * x86, kunit
> >   - drm_test_check_invalid_plane_state_downscaling_invalid
> >   - drm_test_check_invalid_plane_state_drm_plane_helper
> >   - drm_test_check_invalid_plane_state_drm_test_check_invalid_plane_state
> >   - drm_test_check_invalid_plane_state_positioning_invalid
> >   - drm_test_check_invalid_plane_state_upscaling_invalid
> >   - drm_test_check_plane_state_clipping_rotate_reflect
> >   - drm_test_check_plane_state_clipping_simple
> >   - drm_test_check_plane_state_downscaling
> >   - drm_test_check_plane_state_drm_test_check_plane_state
> >   - drm_test_check_plane_state_positioning_simple
> >   - drm_test_check_plane_state_rounding1
> >   - drm_test_check_plane_state_rounding2
> >   - drm_test_check_plane_state_rounding3
> >   - drm_test_check_plane_state_rounding4
> >   - drm_test_check_plane_state_upscaling
> 
> I found the source of failure to be f1e75da5364e ("drm/atomic: Loosen FB
> atomic checks").
> 
> Fortunately for us, it's already been reverted yesterday for some
> unrelated reason, so it should be fixed in next-20231205 onward.

Sorry, that's a bummer that these patches were reverted.  :(  The whole
episode was a bit unfortunate...

Qualcom has been working on those patches for a year.  They must not be
using kunit testing as part of their QC...  It's some kind of
communication failure on our part.

Hopefully we can get this all sorted out and re-apply the patches soon.

regards,
dan carpenter
