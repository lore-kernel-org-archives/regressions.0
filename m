Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472DF4681
	for <regressions@lists.linux.dev>; Thu,  6 Oct 2022 17:23:41 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id 10so2371174pli.0
        for <regressions@lists.linux.dev>; Thu, 06 Oct 2022 10:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UAw0bo7BpTjbC8TYsIXNTxWUDQl2qr0AwdNXiKiDC5I=;
        b=Vi5knA1otkqB5+jtpnDMPTqLoMRutD6lVJ8HpHSBZv0XiHl/hWWWrS5HE3UG+eRg4U
         trridq884uNFOrwcf7QHSavxXsVnNGAE4lFccLyS2HAp/c/Q+X7WfNe14oxf8V/igNRQ
         1NrgGnXJfSXOZEVSsD4FvFJTtmYfWzZ1SkjgpcouOyFjvbsFgZZAoL4cAbgAZAdCOiQS
         dSIkeOkMwUqcrYZgVyZZ9PyhhA/bDTAs2eBDmrpKcEqCkwKj4lG9NOx+SDRb5sOOgRZH
         lQIRQEJa73XHrWGVX+wakhbMTIY6suLIpzqSdsv1wMU6vrqK8i3LMkc8AVrZAfFDLuhj
         R1+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UAw0bo7BpTjbC8TYsIXNTxWUDQl2qr0AwdNXiKiDC5I=;
        b=wCDauoWd6XAQyvwBdKJe3Bk6AebCCdVqgMg76y1K6ugsq+mLLzsu3RgQkmeul11dny
         SAKHGY2feovc05BsZK7i9RzS33FqzqbG8ug0+ySPRD4XL8IR3jrpyRPKONxd+xS+vpAW
         8PPj6COXq2AzLZ/ZdjyshU1GU9DH5tywk6yOxpiNAMKNTR9l5NeIQ7GinB7m+QwL5tVN
         xD/e6sGGbMfOWAoBUZBBgI7+ljvUtJp/rGZhJ3wArtFvHevpzxWCOqhjkD9oFIYGj2WW
         he8K0Z0brDOXFCk2EBoyv4kN4KiQmr7g3W9NAgxrgVK9oGcQDAA2m/kbcrDDcxT5ahBh
         vs/A==
X-Gm-Message-State: ACrzQf00E3s35DmFiFgVaeWATbrymJwVLCKwXF76aZn2uePgBSbq2CIJ
	TL2CxFue+TqXGjDJGjWqGLM=
X-Google-Smtp-Source: AMsMyM76SSe/RbAiHrLfTgpz8b467HPmPADlaDsRY97uhvhSLw0E9/3l2Zvsfj3NUUgzLaoQhZummg==
X-Received: by 2002:a17:90b:1805:b0:20a:cd8e:abd with SMTP id lw5-20020a17090b180500b0020acd8e0abdmr767315pjb.94.1665077020618;
        Thu, 06 Oct 2022 10:23:40 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y62-20020a17090a53c400b0020aaa678098sm3098894pjh.49.2022.10.06.10.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 10:23:39 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 6 Oct 2022 10:23:37 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Hamza Mahfooz <hamza.mahfooz@amd.com>
Cc: linux-kernel@vger.kernel.org, Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	"Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>, "Lee, Alvin" <Alvin.Lee2@amd.com>,
	Alex Hung <alex.hung@amd.com>,
	Pavle Kotarac <Pavle.Kotarac@amd.com>,
	Stylon Wang <stylon.wang@amd.com>,
	Aurabindo Pillai <aurabindo.pillai@amd.com>,
	"Leo (Hanghong) Ma" <hanghong.ma@amd.com>,
	Hersen Wu <hersenwu@amd.com>, Paul Hsieh <paul.hsieh@amd.com>,
	Jimmy Kizito <Jimmy.Kizito@amd.com>, amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, regressions@lists.linux.dev
Subject: Re: [PATCH] drm/amd/display: fix array-bounds error in
 dc_stream_remove_writeback()
Message-ID: <20221006172337.GA753466@roeck-us.net>
References: <20220927191200.216488-1-hamza.mahfooz@amd.com>
 <20221006064615.GA2817657@roeck-us.net>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221006064615.GA2817657@roeck-us.net>

On Wed, Oct 05, 2022 at 11:46:15PM -0700, Guenter Roeck wrote:
> On Tue, Sep 27, 2022 at 03:12:00PM -0400, Hamza Mahfooz wrote:
> > Address the following error:
> > drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c: In function ‘dc_stream_remove_writeback’:
> > drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c:527:55: error: array subscript [0, 0] is outside array bounds of ‘struct dc_writeback_info[1]’ [-Werror=array-bounds]
> >   527 |                                 stream->writeback_info[j] = stream->writeback_info[i];
> >       |                                 ~~~~~~~~~~~~~~~~~~~~~~^~~
> > In file included from ./drivers/gpu/drm/amd/amdgpu/../display/dc/dc.h:1269,
> >                  from ./drivers/gpu/drm/amd/amdgpu/../display/dc/inc/core_types.h:29,
> >                  from ./drivers/gpu/drm/amd/amdgpu/../display/dc/basics/dc_common.h:29,
> >                  from drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c:27:
> > ./drivers/gpu/drm/amd/amdgpu/../display/dc/dc_stream.h:241:34: note: while referencing ‘writeback_info’
> >   241 |         struct dc_writeback_info writeback_info[MAX_DWB_PIPES];
> >       |
> > 
> > Currently, we aren't checking to see if j remains within
> > writeback_info[]'s bounds. So, add a check to make sure that we aren't
> > overflowing the buffer.
> > 
> > Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
> 
> With gcc 11.3, this patch doesn't fix a problem, it introduces one.
> 
> Building csky:allmodconfig ... failed
> --------------
> Error log:
> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c: In function 'dc_stream_remove_writeback':
> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c:527:83: error: array subscript 1 is above array bounds of 'struct dc_writeback_info[1]' [-Werror=array-bounds]
>   527 |                                 stream->writeback_info[j] = stream->writeback_info[i];
> 
> Building mips:allmodconfig ... failed
> --------------
> Error log:
> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c: In function 'dc_stream_remove_writeback':
> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c:527:83: error: array subscript [0, 0] is outside array bounds of 'struct dc_writeback_info[1]' [-Werror=array-bounds]
>   527 |                                 stream->writeback_info[j] = stream->writeback_info[i];
> 
> Building arm:allmodconfig ... failed
> --------------
> Error log:
> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c: In function 'dc_stream_remove_writeback':
> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c:527:83: error: array subscript [0, 0] is outside array bounds of 'struct dc_writeback_info[1]' [-Werror=array-bounds]
>   527 |                                 stream->writeback_info[j] = stream->writeback_info[i];
> 

#regzbot introduced: 5d8c3e836fc2

Complete list of build failures in my test system due to this patch,
observed when building with gcc 11.3:

Build results:
	total: 149 pass: 131 fail: 18
Failed builds:
	alpha:allmodconfig
	arm:allmodconfig
	arm64:allmodconfig
	csky:allmodconfig
	i386:allyesconfig
	i386:allmodconfig
	mips:allmodconfig
	openrisc:allmodconfig
	parisc:allmodconfig
	powerpc:allmodconfig
	powerpc:ppc32_allmodconfig
	riscv32:allmodconfig
	riscv:allmodconfig
	s390:allmodconfig
	sparc64:allmodconfig
	x86_64:allyesconfig
	x86_64:allmodconfig
	xtensa:allmodconfig

Guenter
