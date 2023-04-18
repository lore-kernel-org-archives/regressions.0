Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41652AFE6
	for <regressions@lists.linux.dev>; Tue, 18 Apr 2023 19:12:11 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id c9so37060684ejz.1
        for <regressions@lists.linux.dev>; Tue, 18 Apr 2023 12:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1681845129; x=1684437129;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5O/u9jEo7tTXxqFeP9AYKB4xUAFuRax6QX9V+31xwXs=;
        b=XJeD+SduivfQWDRuxp6WilkqyLPbQ85OZkbWr4xh7JDdXguUtKAwblod0XYuI1L5k/
         /QyG4NtiHCmINA/6jrylNoLZC8DFcgZ0KuinVSuwjxfesb5gVIYq0Slb9jucaZDN6YvB
         fogPDrYyePyZdNTfA48Ig6kfx2HxgP6SECVs8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681845129; x=1684437129;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5O/u9jEo7tTXxqFeP9AYKB4xUAFuRax6QX9V+31xwXs=;
        b=avIhJ90JAKz5noQPUcXPMcpTLZtLBUoSssS/cS6g61hfT5TFAhWZ2Bl5G37H7m8JYl
         zX00x+5qy6M2GCcS13w/OwrAf0lEqEAvCQ3Xn48fQkYizqvF9A1FM1wlWzDieD5DIm1l
         dAZbvv0IeLhSu+UNhzVvaYbziH/kf8yKu1JmGLjEczFdIiZTNWzWI/0SYWKSzI721ZpQ
         rNT+krThIPErdJK54ipNv+URTqwKqatJoREpOxGmV9571gZ3qnRKyutXZcID0eBjwLa1
         pQqbWTfbnu3zTMmhEu/vdNKX3upTDoeOSXkItnnrvjgb2N0RCDh+6MwBuiv1Z4Q8uK88
         x4OA==
X-Gm-Message-State: AAQBX9c1AQ846XV6Vg2pNM3TAfq3pMHnY5oyl8wY4uhAZ7zK0W9ulbY0
	WqO+UbPYAGfceBWDcA1mJWrsjIvXTlligv9Bb7oWjA==
X-Google-Smtp-Source: AKy350ag9Solx7ZylGybbZJZl/1jcvYHNwjuxQoD5aQYP4PspF5zcYzCeucCTxbhZ3wPbMkH1FKoRA==
X-Received: by 2002:a17:906:6816:b0:951:786f:e3b3 with SMTP id k22-20020a170906681600b00951786fe3b3mr3396100ejr.34.1681845128846;
        Tue, 18 Apr 2023 12:12:08 -0700 (PDT)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com. [209.85.218.49])
        by smtp.gmail.com with ESMTPSA id x17-20020aa7dad1000000b005027d31615dsm7274309eds.62.2023.04.18.12.12.08
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Apr 2023 12:12:08 -0700 (PDT)
Received: by mail-ej1-f49.google.com with SMTP id kt6so37743959ejb.0
        for <regressions@lists.linux.dev>; Tue, 18 Apr 2023 12:12:08 -0700 (PDT)
X-Received: by 2002:a17:906:57c7:b0:94e:fe9a:31ff with SMTP id
 u7-20020a17090657c700b0094efe9a31ffmr5866849ejr.4.1681845127864; Tue, 18 Apr
 2023 12:12:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <168166781352.1843526.278570500979918184@leemhuis.info>
 <CAHk-=wjQaxmXTR68VnEJvLgB=H2agMTrrF4EXkXT4Hbdf2ZuMQ@mail.gmail.com> <20230418182036.GS19619@suse.cz>
In-Reply-To: <20230418182036.GS19619@suse.cz>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 18 Apr 2023 12:11:51 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjL7GG9s9Y2+u2725M+Ru=bUXnzOnXRwoSktY0fVdhhzw@mail.gmail.com>
Message-ID: <CAHk-=wjL7GG9s9Y2+u2725M+Ru=bUXnzOnXRwoSktY0fVdhhzw@mail.gmail.com>
Subject: Re: Linux regressions report for mainline [2023-04-16]
To: dsterba@suse.cz
Cc: "Regzbot (on behalf of Thorsten Leemhuis)" <regressions@leemhuis.info>, Rafael Wysocki <rafael@kernel.org>, 
	David Sterba <dsterba@suse.com>, LKML <linux-kernel@vger.kernel.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 18, 2023 at 11:20=E2=80=AFAM David Sterba <dsterba@suse.cz> wro=
te:
>
> There's also in-memory cache of already trimmed ranges since last mount
> so even running discard repeatedly (either fstrim or as mount option)
> will not do extra IO. We try hard not to provoke the firmware bugs.

So we've had devices that claim to support discard, and then simply don't.

I have dim memories of people reporting IO simply stopping working
after a discard when it confused the GC logic too much.

And yes, those dim memories are from many years ago when SSD's were
new and fancy, and we had all kinds of crazy stuff going on, including
serious big SSD manufacturers that came to the kernel summit and said
that we need to do IO in 64kB aligned hunks, because doing GC was too
hard.

Those people have now thankfully gone off and done shingled drives
instead and we can mostly ignore them (although I do note that btrfs
seems to be gulping down the shingled drive koolaid too), but I'm
afraid that some of that incompetence still exists in the form of old
drives.

And some of it isn't even that old. See commit 07d2872bf4c8 ("mmc:
core: Add SD card quirk for broken discard") which is from late last
year. I'm not sure what the failure case there was (apart from the
"mk2fs failed", which I _assume_ was mkfs or mke2fs).

The real problem cases tend to be things like random USB memory sticks
etc. I think the Sandisk MMC case is not that different. A lot of odd
small embedded flash controllers that have never been tested except
under Windows or in cameras or whatever.

So discard tends to have two classes of problems

 (a) performance problems due to being non-queued, or simply because
the flash controller is small and latency can be absolutely *huge*
when it processes trims

 (b) the "it doesn't work at all" problem

and it's really that "it doesn't work" case I worry about.

We have quite a few trim-related quirks. Do this:

    git grep HORKAGE.*TRIM

to see just the libata cases. Yes, some of those are "the queued
version doesn't work". Others are just "it's not zero after trim".
Whatever. But some of them are literally "do not use trim at all".

See commit cda57b1b05cf ("libata: force disable trim for SuperSSpeed
S238"), and tell me that the sentence

  "This device loses blocks, often the partition table area, on trim"

doesn't worry you? Ok, so that's from 2015, so "old drives only".

Or how about c8ea23d5fa59 ("ata: libata-core: Disable TRIM on M88V29")
from last year:

   "While it also advertises TRIM support, I/O errors are reported
    when the discard mount option fstrim is used. TRIM also fails
    when disabling NCQ and not just as an NCQ command"

Again, that's libata - odd crazy hardware. But it's exactly the odd
crazy hardware that worries me. When the failure mode isn't "it's
slow", but "it ATE MY WHOLE DISK", that's a scary scary problem.

Hmm?

I dunno. Maybe you have reason to believe that all of these cases have
been fixed, or that some of these were caused by kernel bugs because
we did things wrong, and those have been fixed.

But the failure modes just makes me worry. From your email, it *seems*
like you think that the failures were primarily performance-related.

                Linus
