Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5324129CA
	for <regressions@lists.linux.dev>; Fri,  7 Jan 2022 21:33:56 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id j6so26824836edw.12
        for <regressions@lists.linux.dev>; Fri, 07 Jan 2022 13:33:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Cl6ubDfyPf0bsIiZ+HAM7SA17QVqusHqEuiF6QMZ3Bg=;
        b=ABAD+YAbdjT5EUrLXHFKr67FkiWrHrUpU/iOotM2olGVkDHQ6usGgHURcWEsKJwSy9
         bvVZRAAiTAk3xiGj0rwDL82GmvRo8ER6JA/LIIUPdLunGOe30u2hBhVJDsCUO4Z4lGxN
         FbcJvMpH6iFpxiyPev64kNMEdeZrd2uZ+nvjQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Cl6ubDfyPf0bsIiZ+HAM7SA17QVqusHqEuiF6QMZ3Bg=;
        b=k0swANXKH9yUv1FDsuXgAt5xlbK/CwZ4cUDIDyIYZIOQ+8fJXKPQnU5IDUiu8hyb5o
         G0lrMgjX5RjwHzbpoccHylgE2O+8PhaQ1qsTAMT+CMW0tkBQN3BWnxdF1xBMBa7Ph5I4
         V59UR4me+rTz76oLPhoHAvdzfJhI7bjwlZ3arw6tMEVK6wTNsx3hqUd5/xbeSgGFUt7X
         LYCgAHbrPnjYQuvU2JGi+J30AvHw2H1J0bOJ1KmzWneG84OzPVAv77N+IoN22FN7u/DE
         XFgzzPsRI9bKmWQtMSw2BfmTFfD9lsKQ4xq248CZaUSajwB05njuq7oFtlilNIdLPROS
         jqxw==
X-Gm-Message-State: AOAM531mHokS2xyjwn2e0eQmwn9LVj5iVv86NgAGMXjatURpqH0LNjdm
	BkHaOV60vHy4fKqT+P3ikhtNp1eD8w99Jrms85M=
X-Google-Smtp-Source: ABdhPJyoryUszkmwhpYEZU6jJcrwApzIEPZ1VfTmGC8m/WFsO9c/JYC4Xb2LQmyvqUx8kxko5t7YMw==
X-Received: by 2002:a17:907:d07:: with SMTP id gn7mr52443615ejc.553.1641591234353;
        Fri, 07 Jan 2022 13:33:54 -0800 (PST)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com. [209.85.221.45])
        by smtp.gmail.com with ESMTPSA id s7sm2586652edx.56.2022.01.07.13.33.53
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jan 2022 13:33:53 -0800 (PST)
Received: by mail-wr1-f45.google.com with SMTP id t28so6685317wrb.4
        for <regressions@lists.linux.dev>; Fri, 07 Jan 2022 13:33:53 -0800 (PST)
X-Received: by 2002:a05:6000:10d2:: with SMTP id b18mr55413119wrx.193.1641591233488;
 Fri, 07 Jan 2022 13:33:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <7cd73147-2170-a0cd-c64e-ded4bef645b0@leemhuis.info>
In-Reply-To: <7cd73147-2170-a0cd-c64e-ded4bef645b0@leemhuis.info>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 7 Jan 2022 13:33:37 -0800
X-Gmail-Original-Message-ID: <CAHk-=wizbxtkFsWgR6v_24ksFE3ur6RHNg=X_PR5E5AM2XvC7w@mail.gmail.com>
Message-ID: <CAHk-=wizbxtkFsWgR6v_24ksFE3ur6RHNg=X_PR5E5AM2XvC7w@mail.gmail.com>
Subject: Re: Special regressions report for the pending 5.16 release
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>, Song Liu <songliubraving@fb.com>, 
	Jens Axboe <axboe@kernel.dk>, Wolfram Sang <wsa@kernel.org>, 
	Mario Limonciello <mario.limonciello@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	"Pan, Xinhui" <Xinhui.Pan@amd.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 7, 2022 at 2:59 AM Thorsten Leemhuis <linux@leemhuis.info> wrote:
>
> [PATCH] md/raid1: fix missing bitmap update w/o WriteMostly devices

Merged.

> Wolfram (CCed) plans to revert a i2c commit to fix it, but I'm not sure
> if he plans to send in onwards for 5.16 (or if that would be a good idea
> at all):

So apparently I'm getting the pull tomorrow.

> * There are suspend and resume problems related to amdgpu:

Fix merged (and tested at least on my system).

          Linus
