Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8511329CA
	for <regressions@lists.linux.dev>; Fri, 31 Dec 2021 19:21:35 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id bm14so111560464edb.5
        for <regressions@lists.linux.dev>; Fri, 31 Dec 2021 11:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YU06RrU6q8sQBZyTzdprAi1+FG3h7shQoFSUPOjUgj8=;
        b=WUx8Mhhd4JwVQESuI9u7ibjcwyDeZgExAuH1BIuRaOVdHGHErUrYtd8S4F7h9peeqh
         8OvDto1JXS/Ie82GmFUdJQWquyftRBj+vshMMwgA2gwN1hOjJnuPUG5fhS0XeSdHGSHu
         vQalMh1yNNmYCULVdEgZQLxGfTbmoE08YWuvE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YU06RrU6q8sQBZyTzdprAi1+FG3h7shQoFSUPOjUgj8=;
        b=4Vhb16lPBVAV3u2KKVfyhjQcwxa2Bo9rU8ua6wo5PjHkMew8i6IPC6MzE/pwNFWFj6
         ozIpXllh8+9j4ZimrAxHJAO1EWhw1JIoQFmk0lVDDN4a+LQv8nGQmKtdHMTvCC5kfgop
         JaU7+Luhr+NuL9VoRhsMLBueiNGDw0FOYoMs/A31MNz3OffahVrX3CHabNw25dg9WZ+2
         TvlIm6L30vcf5MTmNcEJd5MXHQnolltkOHVhnjtEcG8IiJrsio/z9Lp/s06bB3vVVDyP
         TRgQIB+QFtReYX9nAwAt/3VpF89YgKh346NwlmVQuWxNWWBoNcbnY7+uTIOiMXpTNbjw
         SObg==
X-Gm-Message-State: AOAM530+udXFVYW1u0ZSwYLJTcwHlsNnrMUJ9BVbWGoseBA090P3W4dj
	/g5SxPKlJ1ZK9PoDuvaoc6j6lxBqwKbPwFDe
X-Google-Smtp-Source: ABdhPJy7+6GJNrgajkqVujCgr26DSZ7DV9PT4zMYy/ZFavQQGi/WPNdc/KoOGNTX9tNocPseeCANlA==
X-Received: by 2002:a17:906:dfea:: with SMTP id lc10mr30152433ejc.459.1640978493551;
        Fri, 31 Dec 2021 11:21:33 -0800 (PST)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com. [209.85.221.43])
        by smtp.gmail.com with ESMTPSA id nc29sm8667994ejc.3.2021.12.31.11.21.30
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Dec 2021 11:21:31 -0800 (PST)
Received: by mail-wr1-f43.google.com with SMTP id s1so57347564wra.6
        for <regressions@lists.linux.dev>; Fri, 31 Dec 2021 11:21:30 -0800 (PST)
X-Received: by 2002:a5d:6211:: with SMTP id y17mr30389617wru.97.1640978490358;
 Fri, 31 Dec 2021 11:21:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211202150614.22440-1-mgorman@techsingularity.net>
 <caf247ab-f6fe-a3b9-c4b5-7ce17d1d5e43@leemhuis.info> <20211229154553.09dd5bb657bc19d45c3de8dd@linux-foundation.org>
 <5c9d7c6b-05cd-4d17-b941-a93d90197cd3@leemhuis.info> <CAHk-=wi3z_aFJ7kkJb+GDLzUMAzxYMRpVzuMRh5QFaFJnhGydA@mail.gmail.com>
In-Reply-To: <CAHk-=wi3z_aFJ7kkJb+GDLzUMAzxYMRpVzuMRh5QFaFJnhGydA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 31 Dec 2021 11:21:14 -0800
X-Gmail-Original-Message-ID: <CAHk-=whj9ZWJ2Fmv2vY-NAB_nR-KgpzpRx6Oxs=ayyTEN7E8zw@mail.gmail.com>
Message-ID: <CAHk-=whj9ZWJ2Fmv2vY-NAB_nR-KgpzpRx6Oxs=ayyTEN7E8zw@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] mm: vmscan: Reduce throttling due to a failure to
 make progress
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Andrew Morton <akpm@linux-foundation.org>, Mel Gorman <mgorman@techsingularity.net>, 
	Mark Brown <broonie@kernel.org>, Michal Hocko <mhocko@suse.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Alexey Avramov <hakavlad@inbox.lv>, Rik van Riel <riel@surriel.com>, Mike Galbraith <efault@gmx.de>, 
	Darrick Wong <djwong@kernel.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>, Linux-fsdevel <linux-fsdevel@vger.kernel.org>, 
	Linux-MM <linux-mm@kvack.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 31, 2021 at 11:14 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Fri, Dec 31, 2021 at 6:24 AM Thorsten Leemhuis
> <regressions@leemhuis.info> wrote:
> >
> > If we get it into rc8 (which is still possible, even if a bit hard due
> > to the new year festivities), it will get at least one week of testing.
>
> I took it with Hugh's ack from his reply to this, so it should be in rc8.

Pushed out as 1b4e3f26f9f7 ("mm: vmscan: Reduce throttling due to a
failure to make progress")

             Linus
