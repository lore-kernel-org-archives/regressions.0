Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91EFD14AB5
	for <regressions@lists.linux.dev>; Tue, 11 Jul 2023 13:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689082874;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hvnb7JiwKvSnMAgyEjcswiUDuBLsnC0rp2JWm3dcW0o=;
	b=bcKoMiXFAUoRRuHAj8uDYIFCDABelGMPoYv6OKrIdNqRfj3x0VmcaWdQoJwP148WanhnJW
	rbfxxDnad2b1jw2giNNJaMOVEE9aifwb2fDa6fYO9pbwEWjUBGrGFATfZah8oBuJ4jjEcK
	GSw6pZg/XnPupD9m8ANN0bx6Us232Jw=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-249-tbAgRqH7NX6HYPShVo6Dsg-1; Tue, 11 Jul 2023 09:41:09 -0400
X-MC-Unique: tbAgRqH7NX6HYPShVo6Dsg-1
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-57745160c1dso64653347b3.2
        for <regressions@lists.linux.dev>; Tue, 11 Jul 2023 06:41:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689082862; x=1691674862;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hvnb7JiwKvSnMAgyEjcswiUDuBLsnC0rp2JWm3dcW0o=;
        b=d7te0AieelWDtEr8LXuLwppxR547V452bmtq4v4eNJGFFWNnnKoZSkjvPTNgUbt+A8
         qT+toSi1n2uFlB07Si+8N9G4FW+5TgyUr0w5zZB4ldhGKWKYa6FdB0qjvtglQFzZL8pp
         rGJzlnjQ8O96PgHVtDbmwt6KVMTpDKviUlfV8jvMTqgoJoZe3ifnhonjCaYhcbB6z8mS
         DU7wbTMnVX+1ASXczGZ840aE/zPNEtPhvXUZU7vwYFF9HfuklFU6FDFE/euwE8v4kUcZ
         5ZDbHK/7B50/XfqWhOAA9QY4R10lXTuAoTnTzaJX9HHabwKjeF+ySPKatl1lhlboESl9
         i/Hw==
X-Gm-Message-State: ABy/qLYfVP4enAtxLtABgRQ5jRaGGCFztHmhd+ONQzNtzd61PbU6ZeZG
	7CpNQR1Sc2Q2VvQkzpJydYwE5yW7uctNmkt4dQUQtvs1R8eBb+GuaO+HO5Z5HOsn97JiGos8pl6
	Ses5iS4Gq06ulEgQ7J6Off0v3aiu8s8o6YtR/JFH00D09PdQ=
X-Received: by 2002:a25:23d1:0:b0:c69:cf1f:ec0a with SMTP id j200-20020a2523d1000000b00c69cf1fec0amr13124362ybj.15.1689082862668;
        Tue, 11 Jul 2023 06:41:02 -0700 (PDT)
X-Google-Smtp-Source: APBJJlE4ZLOqIjO/yyFhHoIBVoAPEbGrTyKrYmJlC4AJrQfREkKw9AcsD5OXndLzLtud1cBfWt6TWIx1ymEODA6SenA=
X-Received: by 2002:a25:23d1:0:b0:c69:cf1f:ec0a with SMTP id
 j200-20020a2523d1000000b00c69cf1fec0amr13124347ybj.15.1689082862425; Tue, 11
 Jul 2023 06:41:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230621-logitech-fixes-v1-1-32e70933c0b0@redhat.com>
 <2023062156-trespass-pandemic-7f4f@gregkh> <qbvmv3eexohswyagmllfh3xsxoftwa3wbmsdafmwak2bxlnlft@jz74dijlfxlz>
 <31ce32e018a9fa410e9e1f3e5900621b16a56091.camel@hadess.net>
 <CAO-hwJLFSUJaGK5DAOz30+YyC1hGgHnbeJbc5iQ47jxBcbRSCg@mail.gmail.com> <cfa28818-9eaf-0dc9-cb4a-1b3de318e627@leemhuis.info>
In-Reply-To: <cfa28818-9eaf-0dc9-cb4a-1b3de318e627@leemhuis.info>
From: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date: Tue, 11 Jul 2023 15:40:51 +0200
Message-ID: <CAO-hwJLc0wzv2a3JARkPDW+ZgbnvwggfRHcAJmWsKy_FMA13=g@mail.gmail.com>
Subject: Re: [PATCH] HID: logitech-hidpp: rework one more time the retries attempts
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Bastien Nocera <hadess@hadess.net>, Greg KH <gregkh@linuxfoundation.org>, 
	=?UTF-8?Q?Filipe_La=C3=ADns?= <lains@riseup.net>, 
	Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 11, 2023 at 3:10=E2=80=AFPM Linux regression tracking (Thorsten
Leemhuis) <regressions@leemhuis.info> wrote:
>
> On 26.06.23 16:02, Benjamin Tissoires wrote:
> > On Sun, Jun 25, 2023 at 10:30=E2=80=AFAM Bastien Nocera <hadess@hadess.=
net> wrote:
> >> On Fri, 2023-06-23 at 10:37 +0200, Benjamin Tissoires wrote:
> >>> On Jun 21 2023, Greg KH wrote:
> >>>> On Wed, Jun 21, 2023 at 11:42:30AM +0200, Benjamin Tissoires wrote:
> >>>>> Make the code looks less like Pascal.
> >>>>>
> >>>>> Extract the internal code inside a helper function, fix the
> >>>>> initialization of the parameters used in the helper function
> >>>>> (`hidpp->answer_available` was not reset and `*response` wasn't
> >>>>> too),
> >>>>> and use a `do {...} while();` loop.
> >>>>>
> >>>>> Fixes: 586e8fede795 ("HID: logitech-hidpp: Retry commands when
> >>>>> device is busy")
> >>>>> Cc: stable@vger.kernel.org
> >>>>> Signed-off-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> >>>>> ---
> >>>>> as requested by
> >>>>> https://lore.kernel.org/all/CAHk-=3DwiMbF38KCNhPFiargenpSBoecSXTLQA=
CKS2UMyo_Vu2ww@mail.gmail.com/
> >>>>> This is a rewrite of that particular piece of code.
> >>>>> ---
> >>>>>  drivers/hid/hid-logitech-hidpp.c | 102 +++++++++++++++++++++++--
> >>>>> --------------
> >>>>>  1 file changed, 61 insertions(+), 41 deletions(-)
> > [...]
> >
> > Some people on the Bz were able to reproduce with multiple reboots.
> > But it's not as urgent as previously, and we were close to the 6.4
> > final when I sent it. I'll make sure this goes into 6.5 and gets
> > proper stable backports FWIW.
>
> Did that happen? Doesn't look like it from here, but maybe I'm missing
> something. Where there maybe other changes to resolve the remaining
> problems some users encounter sporadically since the urgent fixes went in=
?

No, there were no other changes that could have solved this. I guess
the randomness of the problem makes it way harder to detect and to
reproduce.

I'll send a v2 of that patch with the reviews today or tomorrow and we
can probably get it through the current 6.5 cycle.

Cheers,
Benjamin

>
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> --
> Everything you wanna know about Linux kernel regression tracking:
> https://linux-regtracking.leemhuis.info/about/#tldr
> If I did something stupid, please tell me, as explained on that page.
>

