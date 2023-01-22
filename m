Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74123C1C
	for <regressions@lists.linux.dev>; Sun, 22 Jan 2023 19:18:16 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id jr19so6962277qtb.7
        for <regressions@lists.linux.dev>; Sun, 22 Jan 2023 11:18:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CMi5cwx+cuHLMcTtoOxFI0oclaxImm0+s+XfYyjkeoA=;
        b=Bp9RENQ8zHgKuj9u4YKL4QldSznJ/HWt/kX1f9R/Zym68wO1GD9Piyxd+b+TpO//pr
         d+QAq4jC2+iaAiqhwxQK6uoPDapzbqkXYDP1LwOwcEHKkjTxGYZBvyrgLiYh9ZxTlepV
         WiAUNuz7/gXQ1ALOWdCgpVlRS20DBXc9XwRNc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CMi5cwx+cuHLMcTtoOxFI0oclaxImm0+s+XfYyjkeoA=;
        b=Yxgf8yTTDLdb1hHoXK0Db6fI15CDEipeMa5eK3vqsFnmXbnlqc6bEZNhI4O34uGPpR
         6KvyVV5ZJsL+5Y6xEhO56kdh2zw++B2DyuQ76u6TDwxT+0zKOWNlXzImTPeuWAmDJC7x
         9CIDot+NuQficzQF4YE0vg2N1PosUOq5eMU1yTvuae3LLcAodXvqgAeEz5uijikS9fDi
         jmSaI3NIpa8RV0NtfIYgJpp7tUdrnu4pdjiQwnvEf4196br7pTi/l+30Vb7QIC4tkYxx
         F2rhjkRDuVRCZ2xNGoGNocthf8xaRfwzjr3ZTKrbaI4VF3KZkywnAwoGCeHKv0UdOUuR
         jxzg==
X-Gm-Message-State: AFqh2kr8TqYZezEEIYmeHMfCsUFZGDK0gT97MZDzHjf9jxS2ec4oFR9W
	Wk7IDF2H/OawaLioBlK4GF/MHpiBms5tzmgd
X-Google-Smtp-Source: AMrXdXuwdiT1ovidjLk2YQab5kqWKaV6m8CnTVU16kWw61Iyp4un0HHcbZ3CPAz0jhLpt4VE960wbQ==
X-Received: by 2002:a05:622a:418c:b0:3b6:45f1:4933 with SMTP id cd12-20020a05622a418c00b003b645f14933mr31125612qtb.66.1674415095436;
        Sun, 22 Jan 2023 11:18:15 -0800 (PST)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com. [209.85.222.181])
        by smtp.gmail.com with ESMTPSA id y11-20020a05620a25cb00b006bbf85cad0fsm30450707qko.20.2023.01.22.11.18.14
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Jan 2023 11:18:14 -0800 (PST)
Received: by mail-qk1-f181.google.com with SMTP id s19so5372450qkg.7
        for <regressions@lists.linux.dev>; Sun, 22 Jan 2023 11:18:14 -0800 (PST)
X-Received: by 2002:a37:45d3:0:b0:706:96dd:8d4a with SMTP id
 s202-20020a3745d3000000b0070696dd8d4amr1061783qka.336.1674415094596; Sun, 22
 Jan 2023 11:18:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHk-=wg+E9tTCrSqBOxejUX11f8ebyRWQ+4exC=cmOEupX_d7Q@mail.gmail.com>
 <8ec65f01-89fe-bd6f-a2c2-f4dfc0555cc2@leemhuis.info>
In-Reply-To: <8ec65f01-89fe-bd6f-a2c2-f4dfc0555cc2@leemhuis.info>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 22 Jan 2023 11:17:58 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgkzFgUsU+M55xSzG3hzYajDOqXFzDwnoyRzwKDbEmzag@mail.gmail.com>
Message-ID: <CAHk-=wgkzFgUsU+M55xSzG3hzYajDOqXFzDwnoyRzwKDbEmzag@mail.gmail.com>
Subject: Re: Linux 6.2-rc5
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Vlastimil Babka <vbabka@suse.cz>, 
	Andrew Morton <akpm@linux-foundation.org>, Greg KH <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, Jan 22, 2023 at 5:49 AM Linux kernel regression tracking
(Thorsten Leemhuis) <regressions@leemhuis.info> wrote:
>
> Huh, a -rc on Saturday evening? That's unusual.

Heh. It's my wedding anniversary today.. Not that I won't sit in front
of the computer anyway, but I didn't want to have anything actually
pending.

> But nevertheless there is one thing I want to bring up, even if -rc5 is
> already out: Vlastimil asked me explicitly to highlight ```Revert
> "mm/compaction: fix set skip in fast_find_migrateblock"```[1] in my
> weekly report[2], as me would prefer if that patch could head to
> mainline and especially stable rather sooner than later.

Ok, I assume I'll get it from Andrew one of these days. Thanks for the heads-up.

I'm going to do an rc8 regardless, so we're not quite at the end of
the release yet.

                 Linus
