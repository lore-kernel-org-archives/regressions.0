Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A313D6A
	for <regressions@lists.linux.dev>; Sun,  2 Oct 2022 20:46:30 +0000 (UTC)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-1321a1e94b3so5303582fac.1
        for <regressions@lists.linux.dev>; Sun, 02 Oct 2022 13:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=GA1eijPhe2qLHfwUccL2m31o18WRn+HtU/gv3+g46xc=;
        b=OQ5Fdojd2dOl5xXkqKGgU5wBp9DAbTQrcyIlOkSTvNgzB+qErBRKm4zcjxEI9C4Trc
         KNjmKitUVAp3JCwG2LUbHYnaMpen+vbGQxlsJperGdZuHM8s4F9EwhUbN8CR2zsL7RyE
         KeOYBIUftyho6wUoyQTJmezJBUVx4kY5Bed5g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=GA1eijPhe2qLHfwUccL2m31o18WRn+HtU/gv3+g46xc=;
        b=G7w4Q1azlon0seXzLnMsLyJ3zpz7zo253nJUJWVYT1u2IrLzh+sQSompcTXL8Y3SUC
         xSZ9stz7qV4mxmfOj3fYINEeA3gdNp5lrZ34/0p+lmY8QYRJ7K+pcNpn1fXZh61qb6r6
         OlF2eHxtFeW55g3ewDaaTcg4tiDFl79YYnVSl5chrfDC89eIVInwjkoth56ujrVQk8mR
         g9DE4VEw0gIT4qY0O0+1bLoUrWWhEQynmttajHv8RxZAxKLdo33/5OO6rMdrrpOlFr0N
         sbiDq3B0sUV2zQwjITfEBWuXimv9fe5IJui6Bsuy4uehxZj5I5OyQquyPSyGDhjTzHbj
         UHSw==
X-Gm-Message-State: ACrzQf3m310fljZ9/GsGV4q1AP33f7Hw72YwNHLYsBg2O4uA/H/EYY7C
	6fTrJ00dFFcoT/wqYkR5CQYHaig5NWJCOg==
X-Google-Smtp-Source: AMsMyM57Js3XtzTz6kINF1vpR2tjZt9YeGjjenfF9mhkSkvNf13PGBlWCK7kqAcz7WhQnwL7MsIU6w==
X-Received: by 2002:a05:6870:d38e:b0:132:7895:e135 with SMTP id k14-20020a056870d38e00b001327895e135mr468908oag.199.1664743588334;
        Sun, 02 Oct 2022 13:46:28 -0700 (PDT)
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com. [209.85.161.52])
        by smtp.gmail.com with ESMTPSA id l11-20020a056870204b00b0012796e8033dsm2370487oad.57.2022.10.02.13.46.26
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Oct 2022 13:46:26 -0700 (PDT)
Received: by mail-oo1-f52.google.com with SMTP id r136-20020a4a378e000000b004755953bc6cso5611661oor.13
        for <regressions@lists.linux.dev>; Sun, 02 Oct 2022 13:46:26 -0700 (PDT)
X-Received: by 2002:a05:6830:611:b0:65c:26ce:5dc with SMTP id
 w17-20020a056830061100b0065c26ce05dcmr7102608oti.176.1664743586515; Sun, 02
 Oct 2022 13:46:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <9a2fdff8-d0d3-ebba-d344-3c1016237fe5@gmx.com> <YzgY9X/DM9t/ZuJe@kroah.com>
 <f8cbb12c-590b-28a3-e3e9-d3fb0d7e3c90@gmx.com> <d7798453-3105-7adf-a9a6-76e8cfe4d012@leemhuis.info>
 <83f6dd2b-784a-e6d3-ebaf-6ad9cfe4eefe@gmx.com> <a676e5cf-c67b-7946-ce73-8fb8d63a5a0a@leemhuis.info>
 <Yzg7pHspc72I7TAb@mit.edu> <e98597e8-9ddb-bbf0-7652-691327186a92@gmx.com>
 <YzmBjgXq9geMnL1B@mit.edu> <79bb605a-dab8-972d-aa4a-a5e5ee49387c@gmx.com>
 <YzmhoglDyEf3z0n8@kroah.com> <ce0b5780-a8cd-83fc-5b91-3acc574f426e@gmx.com>
In-Reply-To: <ce0b5780-a8cd-83fc-5b91-3acc574f426e@gmx.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 2 Oct 2022 13:46:10 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiGZEGY7kDXSD3ryL3yJ6fMp-+zzdyRFUc30kW+512-2w@mail.gmail.com>
Message-ID: <CAHk-=wiGZEGY7kDXSD3ryL3yJ6fMp-+zzdyRFUc30kW+512-2w@mail.gmail.com>
Subject: Re: Planned changes for bugzilla.kernel.org to reduce the "Bugzilla blues"
To: "Artem S. Tashkinov" <aros@gmx.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, "Theodore Ts'o" <tytso@mit.edu>, 
	Thorsten Leemhuis <linux@leemhuis.info>, Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
	workflows@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>, ksummit@lists.linux.dev, 
	Mario Limonciello <mario.limonciello@amd.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, Oct 2, 2022 at 12:27 PM Artem S. Tashkinov <aros@gmx.com> wrote:
>
> It's so weird to read this I'm just dumbfounded.

The *real* dumbfoundedness here is how you seem to think you have the
right to tell people how to work, when you've been told over and over
how bugzilla doesn't fit in the workflow, and isn't worth the effort
and time.

And when people tell you that if you care about bugzilla, then it is
*you* who should spend the time there, you say that you are
dumbfounded. Because only you can tell people how they should work,
right?

Please go away, and look in the mirror a bit.

                  Linus
