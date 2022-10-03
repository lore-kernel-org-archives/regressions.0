Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A772A17C1;
	Mon,  3 Oct 2022 06:37:30 +0000 (UTC)
Received: by mail-qv1-f52.google.com with SMTP id z18so6229399qvn.6;
        Sun, 02 Oct 2022 23:37:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=Bk2C3u/t27y03cPLtgq1Q59OlKnnWoH0jHqzc388cwA=;
        b=DcrHv21e8thhA0MwlhBnrRb0Nx3BFz2yp6oOZyHgDOOVXYgcqkgO2Vos6ayPqx19Gz
         oiPhZKOUuUynZlyESf7jKrOXNfvRnJGoVITS9ROKbwxEg6B6uanut0qekRj1Y00cABwd
         qVTSiclpJxD/PPkb/nnHoK5gJdRAXqqA8ho7XuDGfpNEkJbvnjhHvq/MMzuZ9TRTlIit
         uChL70ZKj1lryfvkgZHWQgZFYOXz636190BrcK33SnRScyweKvB7maPL7wvPAxPM1Tse
         lrHkMH/9Hgalq+2dBx7NfQYRCQCC81XBtQztzTY66yA8Ia9ONohYE1cfUec8licc7W1g
         kNiQ==
X-Gm-Message-State: ACrzQf1KoeF1ZOI7AZAR+9J5r53tvnq2tayQ8LQuivVzGI0ws9KwIP2Y
	XujAJv+RySvndEv6a6L7H5Zcm+0PIHs+7w==
X-Google-Smtp-Source: AMsMyM6Ad9qSCkgoEvbJ2RK6GwX7J7zx04MMxzTpXuzRkD3Wsavz4ce4o4P/9R47sq0JlCpiIvkqyQ==
X-Received: by 2002:a05:6214:966:b0:4ac:79c8:d37e with SMTP id do6-20020a056214096600b004ac79c8d37emr15345130qvb.79.1664779049167;
        Sun, 02 Oct 2022 23:37:29 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id ay43-20020a05620a17ab00b006b945519488sm9989734qkb.88.2022.10.02.23.37.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Oct 2022 23:37:28 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-357208765adso56044537b3.12;
        Sun, 02 Oct 2022 23:37:27 -0700 (PDT)
X-Received: by 2002:a81:848c:0:b0:356:e173:2c7a with SMTP id
 u134-20020a81848c000000b00356e1732c7amr10829162ywf.502.1664779047579; Sun, 02
 Oct 2022 23:37:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <83f6dd2b-784a-e6d3-ebaf-6ad9cfe4eefe@gmx.com> <a676e5cf-c67b-7946-ce73-8fb8d63a5a0a@leemhuis.info>
 <Yzg7pHspc72I7TAb@mit.edu> <e98597e8-9ddb-bbf0-7652-691327186a92@gmx.com>
 <YzmBjgXq9geMnL1B@mit.edu> <79bb605a-dab8-972d-aa4a-a5e5ee49387c@gmx.com>
 <20221002150522.ul4nbtfawqjhnsag@meerkat.local> <b594681b-6b8c-ffb7-f526-3da847d160a8@gmx.com>
 <20221002205430.GC22129@1wt.eu> <d1f99826-2a66-c2d5-c9cd-d2fadd35eca4@gmx.com>
 <20221002213235.GA22532@1wt.eu> <867b35b7-da2b-fed0-1f75-b2021d9be499@gmx.com>
In-Reply-To: <867b35b7-da2b-fed0-1f75-b2021d9be499@gmx.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 3 Oct 2022 08:37:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVkFdXiqV-k2X8yDh5VkR3cv0a4z78z+uCF_PfgHgGx=Q@mail.gmail.com>
Message-ID: <CAMuHMdVkFdXiqV-k2X8yDh5VkR3cv0a4z78z+uCF_PfgHgGx=Q@mail.gmail.com>
Subject: Re: Planned changes for bugzilla.kernel.org to reduce the "Bugzilla blues"
To: "Artem S. Tashkinov" <aros@gmx.com>
Cc: Willy Tarreau <w@1wt.eu>, Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
	"Theodore Ts'o" <tytso@mit.edu>, Thorsten Leemhuis <linux@leemhuis.info>, 
	Greg KH <gregkh@linuxfoundation.org>, workflows@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>, ksummit@lists.linux.dev, 
	Mario Limonciello <mario.limonciello@amd.com>
Content-Type: text/plain; charset="UTF-8"

Hi Artem,

On Sun, Oct 2, 2022 at 11:54 PM Artem S. Tashkinov <aros@gmx.com> wrote:
> It's easy to join an existing bug report. Tell me how can I join an
> existing email thread without being first subscribed to it? I certainly
> can, absolute most people will not be able to.

lore.kernel.org

> What about sending large dump files? Should everyone on the mailing list
> receive it?

post a link

> A bug report is a simple plain list of messages in a single place which
> could be read with a web browser. An email thread is anything but.

lore.kernel.org

> Searching through many emails at once? Good luck with that.

lore.kernel.org

> Replying to a particular email? Good luck with that.

lore.kernel.org

> It looks like you're under the impression that every Linux user who is
> willing to ever use Linux must:
>
> 1) Subscribe to _all_ the existing mailing lists (just in case - what if
> you need to work on something which was started by someone else)

lore.kernel.org

> 2) Know the email etiquette

Just Be Polite

> 3) Learn to be persistent and resend (an unknown number of times) your
> concerns hoping they will eventually be addressed.
>
> Bugzilla: sign up once. Follow up. If you file a dupe, hopefully it will
> be marked as a dupe. Everyone's happy. No particular skills, email
> clients, formatting, referencing, etc. etc. etc.

Having at last the skill to provide a good rebug port would be nice...

Now, back to work. The merge window has opened, so there will be
bugs to report and/or fix...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
