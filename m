Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284BE36B
	for <regressions@lists.linux.dev>; Thu,  3 Mar 2022 00:51:09 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id g39so5695436lfv.10
        for <regressions@lists.linux.dev>; Wed, 02 Mar 2022 16:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WKFSF7MRn4RD8kJD0JeqBVCVJ3EJ3QGDTxIuE+JKKlc=;
        b=N4W/mHdUxMLhKDYm4EXBOpGR1LzgGEbDRtFg8Uw+7ULGn1zMR1qVw8F12LuDfSX7WM
         +UZpXxAH2RlpXEr1DSYOoRjl973nvFkn6xR3p4/F28kuztWFRkyXsWogbSguSXKA8Llw
         Gzv+NYJiwhY9x1qWLL/y5bct3E9P9S+LJO7/8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WKFSF7MRn4RD8kJD0JeqBVCVJ3EJ3QGDTxIuE+JKKlc=;
        b=G09uw4fSZuR9Z6fyYcYkZpSxcGs94kPb8oBApuKyAqc+INNqmeBa8+GLYHp5iQCz4f
         Agf2MpvjdFNIHZYTzGp3bLGaR2imgYgRhuky2SCHMUaMD1TTtjscD7OityM1pd55M3NF
         juH0J7iUbYTs0Mhi+iYyEz0lD+KzMSsv3QYFTsqZoeM522iuKEhHUtrhOeOpIMNhq1ME
         WDa1XAuRJmrvBVTe7sWZ7gExuRhwPYzWP1gNFF04EHisrfvqM2PMV4swexxJ4BXAR1er
         +BRs9Yil6FOsC13LS2lO0VaVqoDn2SyoLKz7Nm2DuRHHwkLdfP1a56up+Osq2gG1puMA
         raJA==
X-Gm-Message-State: AOAM533wr+NWsAarxkbSxtx7G/OyGD+qORbvjXoies3sL/WFXXk4nUU+
	Tgor3XEQuzUeyR8+MuOzm9ATzN5Y3GqO7FQ1CFA=
X-Google-Smtp-Source: ABdhPJx9GP2WydQJDl4n8QT99Wo4QKMLY6BcABU03un9XO83w+MuJ9bzYdGHevf4Q1kye9LjyHTz3Q==
X-Received: by 2002:a05:6512:3094:b0:442:ca74:a610 with SMTP id z20-20020a056512309400b00442ca74a610mr19713251lfd.438.1646268666894;
        Wed, 02 Mar 2022 16:51:06 -0800 (PST)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com. [209.85.167.54])
        by smtp.gmail.com with ESMTPSA id a21-20020a19f815000000b00443977d5a61sm116947lff.110.2022.03.02.16.51.04
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Mar 2022 16:51:04 -0800 (PST)
Received: by mail-lf1-f54.google.com with SMTP id j7so5710354lfu.6
        for <regressions@lists.linux.dev>; Wed, 02 Mar 2022 16:51:04 -0800 (PST)
X-Received: by 2002:ac2:5313:0:b0:443:99c1:7e89 with SMTP id
 c19-20020ac25313000000b0044399c17e89mr19366064lfh.531.1646268663457; Wed, 02
 Mar 2022 16:51:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAJjP=Bt52AW_w2sKnM=MbckPkH1hevPMJVWm_Wf+wThmR72YTg@mail.gmail.com>
 <CAH2r5mt_2f==5reyc0HmMLvYJVmP4Enykwauo+LQoFGFbVFeRQ@mail.gmail.com>
 <CAJjP=BvNVOj3KRnhFgk6xiwnxVhxE-sN98-pr6e1Kzc5Xg5EvQ@mail.gmail.com>
 <CAH2r5mvsetx5G+c=8ePh+X8ng7FvMrnuM9+FJ4Sid4b3E+T41Q@mail.gmail.com>
 <CAJjP=BvqZUnJPq=C0OUKbXr=mbJd7a6YDSJC-sNY1j_33_e-uw@mail.gmail.com>
 <CAN05THSGwCKckQoeB6D91iBv0Sed+ethK7tde7GSc1UzS-0OYg@mail.gmail.com>
 <CAJjP=BvcWrF-k_sFxak1mgHAHVVS7_JZow+h_47XB1VzG2+Drw@mail.gmail.com>
 <ebf8c487-0377-834e-fbb7-725cceae1fbb@leemhuis.info> <CAN05THRJJj48ueb34t18Yj=JYuhiwZ8hTvOssX4D6XhNpjx-bg@mail.gmail.com>
 <f7eb4a3e-9799-3fe4-d464-d84dd9e64510@leemhuis.info> <CAJjP=Bus1_ce4vbHXpiou1WrSe8a61U1NzGm4XvN5fYCPGNikA@mail.gmail.com>
 <fe156bb6-c6d2-57da-7f62-57d2972bf1ae@leemhuis.info>
In-Reply-To: <fe156bb6-c6d2-57da-7f62-57d2972bf1ae@leemhuis.info>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 2 Mar 2022 16:50:47 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjSBvRk-ksUBOiQzJd=e19UZKvOSZs1UHahK5U0QVh6RQ@mail.gmail.com>
Message-ID: <CAHk-=wjSBvRk-ksUBOiQzJd=e19UZKvOSZs1UHahK5U0QVh6RQ@mail.gmail.com>
Subject: Re: Possible regression: unable to mount CIFS 1.0 shares from older
 machines since 76a3c92ec9e0668e4cd0e9ff1782eb68f61a179c
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Davyd McColl <davydm@gmail.com>, Steve French <smfrench@gmail.com>, 
	ronnie sahlberg <ronniesahlberg@gmail.com>, CIFS <linux-cifs@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 1, 2022 at 10:58 PM Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
>
> Thx for the update. I pointed Linus towards this thread two times now,
> but he didn't comment on it afaics. CCing him now, maybe that will to
> the trick.

So I have to admit that I think it's a 20+ year old legacy and
insecure protocol that nobody should be using.

When the maintainer can't really even test it, and it really has been
deprecated that long, I get the feeling that somebody who wants it to
be maintained will need to do that job himself.

This seems to be a _very_ niche thing, possibly legacy museum style
equipment, and maybe using an older kernel ends up being the answer if
nobody steps up and maintains it as an external patch.

             Linus
