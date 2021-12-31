Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D559B29CA
	for <regressions@lists.linux.dev>; Fri, 31 Dec 2021 19:22:56 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id f5so111525137edq.6
        for <regressions@lists.linux.dev>; Fri, 31 Dec 2021 11:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0FaWMSBfmWtZkzvxZZ3tF40QOE4zBte4EqNi/u5y60I=;
        b=E/SjcKhF4JFcwzv2/X9miVwVq5ZuHd7raajITq4JeZsOaYHUlIMLL8fT89QVFi8I1y
         NoKWuNsw75AcoAl8eAjbCJ/7mDzs0ypgFYfoJln+z3TQ1dBYG7x/EO1e5qlupTlfnHKT
         R47HkHrOG4EccFnAkS/BskjKUHRPD8bcHdm5c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0FaWMSBfmWtZkzvxZZ3tF40QOE4zBte4EqNi/u5y60I=;
        b=MANqoQJEbr8Lb3ayGqhTEErvbMKXOJsdbtN/EjVmg/UmdRe5cm/sUDsV2JZ7Txnt9z
         gHCUxJ/6yBfgG2v85x1pYZ0qr9aWhZjSF91AEGKFTMLpxw0ItWRn6CoHLfckL4GEwhuR
         eTB7sp0dLkBRhbCoHwhEePz4JOld2cZqChSmW1ivYHAX7uhf/3xjxrYasc4YkRG5aDiF
         PeEkCEfpb9FEvFafZ3jFdWhlr4lvzRtOdtLdAt/UJzh8++6pIjlRoZTX3eR5Cg2b2Y65
         xD98aYIhWs4ofVz3pnNQjq3JCMeMXM5eI+wpVsY+nwX6OwfVPI+deFOJMOUME57e3LND
         6iEw==
X-Gm-Message-State: AOAM531EKOMNFulpfMOsvg6MEWjEywR1+FZJnAVIat2dH0Hil0Vkdi4A
	prwAMdeiwHlUVkIEIqxO773JddXBvQ6rrwKikA8=
X-Google-Smtp-Source: ABdhPJzlulVwkcUh3YUkjs6r9ZU28aIH8EQ1aqPyBda+Eo/hkOb06p8s0uB9uTAgEIYJOMRfEpoBng==
X-Received: by 2002:a05:6402:51cd:: with SMTP id r13mr35021054edd.184.1640978575126;
        Fri, 31 Dec 2021 11:22:55 -0800 (PST)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com. [209.85.221.48])
        by smtp.gmail.com with ESMTPSA id z10sm3322648edb.45.2021.12.31.11.22.51
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Dec 2021 11:22:53 -0800 (PST)
Received: by mail-wr1-f48.google.com with SMTP id k18so20611908wrg.11
        for <regressions@lists.linux.dev>; Fri, 31 Dec 2021 11:22:51 -0800 (PST)
X-Received: by 2002:adf:f54e:: with SMTP id j14mr29689443wrp.442.1640978571474;
 Fri, 31 Dec 2021 11:22:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211202150614.22440-1-mgorman@techsingularity.net>
 <caf247ab-f6fe-a3b9-c4b5-7ce17d1d5e43@leemhuis.info> <20211229154553.09dd5bb657bc19d45c3de8dd@linux-foundation.org>
 <5c9d7c6b-05cd-4d17-b941-a93d90197cd3@leemhuis.info> <CAHk-=wi3z_aFJ7kkJb+GDLzUMAzxYMRpVzuMRh5QFaFJnhGydA@mail.gmail.com>
 <CAHk-=whj9ZWJ2Fmv2vY-NAB_nR-KgpzpRx6Oxs=ayyTEN7E8zw@mail.gmail.com>
In-Reply-To: <CAHk-=whj9ZWJ2Fmv2vY-NAB_nR-KgpzpRx6Oxs=ayyTEN7E8zw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 31 Dec 2021 11:22:35 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjKNjx1EApBoaqB0kZ8BB5r+YReOELA5uwRhwMi17S=qg@mail.gmail.com>
Message-ID: <CAHk-=wjKNjx1EApBoaqB0kZ8BB5r+YReOELA5uwRhwMi17S=qg@mail.gmail.com>
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

On Fri, Dec 31, 2021 at 11:21 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Pushed out as 1b4e3f26f9f7 ("mm: vmscan: Reduce throttling due to a
> failure to make progress")

.. and I _think_ this empties the regzbot queue for this release, Thorsten. No?

                   Linus
