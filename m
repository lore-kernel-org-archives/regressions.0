Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1FC5C84
	for <regressions@lists.linux.dev>; Mon, 10 Oct 2022 20:16:18 +0000 (UTC)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-1324e7a1284so13647180fac.10
        for <regressions@lists.linux.dev>; Mon, 10 Oct 2022 13:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zQo9CpEQOxd8V/Gnq9d1IqgBFMZ32QQpuKIj7r7NKWU=;
        b=dSUXLhcRKIZVH3q5lAX9w1Sjipi2FBkD3S3AJw8zTLfOJybtcjQoPR1iTC7PLnVVuf
         TpaUyfjZ7mwW/0WOfIdM/KQYj8DsRzcXOQWCRdFRAsaNjYx4LhHo9LGEr2BXQo9SVB4c
         Vew7ExS55SDBCIQcUathisVLmkU5xfdBBZyByYFc59O2NtR/SFG3pELPoMILT7pHFkP2
         E5c7mWZIDNSQj6OojMGL1tRz9EcOy82oNgC8XMaGSYGz3UFFBzowfv9SRchUaD5xIi+J
         a5C4WmW5YAgqfam8iTjrfr7Zo6nPUor/YeKLZNRQvYWrPKTGKKqDY7E8tqE0SXPrLUJI
         FZGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zQo9CpEQOxd8V/Gnq9d1IqgBFMZ32QQpuKIj7r7NKWU=;
        b=qmZ30vym4PGowfzPkXCDZOi25/Fklh/QMxg+5OyaXK3be1r5bgJQDFksaIOMsMyQyi
         0Dj6wZd+hl4ls6bqyPDbIXxKL3TeXRmxAdP339wYfeGT97hp2504ESELwApVQb0biM7W
         uC1FyZ7ekIhgRLpkKownz9bbUz9O8sH1NvW7UNh5XQFeu3nTZgVJsfrj9H1pqA7rKHhd
         y2obHs4+QtCzgaT4VC3l2HXWf+LC/QgB0sWzGu2jTXhO/l77QBpBwz3ja1+f36VWGgqP
         5wCmHrqa5xuUyVoEoVO1npsMXvKeB3dzF6tEaW8tBgtlZrYgxTdi5zxy+mvtfG7o7Rmr
         jfgQ==
X-Gm-Message-State: ACrzQf3+RyCNQ+C5R8yUF6AEn+R/rPyq7CsqX9r2coEajBjMFRfteTcz
	/DPqjnI+BwP/kXSj7Rc+hA4QGc221WeG5htZHSU=
X-Google-Smtp-Source: AMsMyM4qJfDM7UUUcDtmV8h9gbgCQq1xrzkSI7eacitRYeX1RGvN1jyZLWCyX1jvdEm9guTjynYyZLTk48YwcyGMRtQ=
X-Received: by 2002:a05:6870:40c8:b0:136:4389:1375 with SMTP id
 l8-20020a05687040c800b0013643891375mr7561495oal.46.1665432977966; Mon, 10 Oct
 2022 13:16:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221010060512.3064524-1-linux@roeck-us.net>
In-Reply-To: <20221010060512.3064524-1-linux@roeck-us.net>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 10 Oct 2022 16:16:06 -0400
Message-ID: <CADnq5_N5wLSnACnpuqVCMm7LGc20cdGdRhtnwRjUBq7vbrZn8A@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: fix array-bounds error in
 dc_stream_remove_writeback() [take 2]
To: Guenter Roeck <linux@roeck-us.net>
Cc: amd-gfx@lists.freedesktop.org, regressions@lists.linux.dev, 
	Leo Li <sunpeng.li@amd.com>, Xinhui.Pan@amd.com, 
	Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, Aurabindo Pillai <aurabindo.pillai@amd.com>, 
	Hamza Mahfooz <hamza.mahfooz@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"

Applied.  Thanks.

Alex

On Mon, Oct 10, 2022 at 2:05 AM Guenter Roeck <linux@roeck-us.net> wrote:
>
> Commit 5d8c3e836fc2 ("drm/amd/display: fix array-bounds error in
> dc_stream_remove_writeback()") tried to fix an array bounds error seen
> with gcc 12.0. Unfortunately, that results in another array bounds error,
> seen with older versions of gcc.
>
> Building csky:allmodconfig ... failed
> --------------
> Error log:
> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c:
>         In function 'dc_stream_remove_writeback':
> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c:527:83:
>         error: array subscript 1 is above array bounds of 'struct dc_writeback_info[1]' [-Werror=array-bounds]
>   527 |                                 stream->writeback_info[j] = stream->writeback_info[i];
>       |                                                             ~~~~~~~~~~~~~~~~~~~~~~^~~
> In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dc.h:1269,
>                  from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/core_types.h:29,
>                  from drivers/gpu/drm/amd/amdgpu/../display/dc/basics/dc_common.h:29,
>                  from drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c:27:
> drivers/gpu/drm/amd/amdgpu/../display/dc/dc_stream.h:241:34: note: while referencing 'writeback_info'
>   241 |         struct dc_writeback_info writeback_info[MAX_DWB_PIPES];
>
> We could check both i and j for overflow to fix the problem. That would,
> however, be not make much sense since it is known and provable that j <= i.
> Also, the check introduced with commit 5d8c3e836fc2 does not really add
> value since it checks if j < MAX_DWB_PIPES. Since it is known that j <= i,
> it would make more sense to check if i < MAX_DWB_PIPES. Unfortunately, that
> does not help to solve the problem observed here: gcc still complains.
>
> To solve the problem, replace the subsequent check for 'i != j' with
> 'j < i'. This is identical to the original check since we know that j <= i,
> and it makes all versions of gcc happy. Drop the check introduced with
> commit 5d8c3e836fc2 since it is not really useful and does not solve the
> problem.
>
> Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>
> Cc: Hamza Mahfooz <hamza.mahfooz@amd.com>
> Fixes: 5d8c3e836fc2 ("drm/amd/display: fix array-bounds error in dc_stream_remove_writeback()")
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  drivers/gpu/drm/amd/display/dc/core/dc_stream.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
> index ae13887756bf..9f568d618cd0 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
> @@ -520,9 +520,9 @@ bool dc_stream_remove_writeback(struct dc *dc,
>         }
>
>         /* remove writeback info for disabled writeback pipes from stream */
> -       for (i = 0, j = 0; i < stream->num_wb_info && j < MAX_DWB_PIPES; i++) {
> +       for (i = 0, j = 0; i < stream->num_wb_info; i++) {
>                 if (stream->writeback_info[i].wb_enabled) {
> -                       if (i != j)
> +                       if (j < i)
>                                 /* trim the array */
>                                 stream->writeback_info[j] = stream->writeback_info[i];
>                         j++;
> --
> 2.36.2
>
