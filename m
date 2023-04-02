Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA4F2F30
	for <regressions@lists.linux.dev>; Sun,  2 Apr 2023 17:49:55 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id t10so108587735edd.12
        for <regressions@lists.linux.dev>; Sun, 02 Apr 2023 10:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1680457793; x=1683049793;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=twCPC0pauRSrcDGPcatZZnRn4es+o8hDMAtgf21b8Ls=;
        b=V1xjAwxIQpU+AKtTAqNqQTXZ5XTfQpwo4FJqpSfOxuxfMAijag35GXzem9qcwW2Grl
         137BTU5gvXiBbzDSEmPfs7+3Rl+4BFwl48XsV6MD8xvTpWZQeuvewmUgOrk/4OvhGu7h
         9gtsaSAf1ocKhC28eHJD8r8M9nHMnnaA6JnUo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680457793; x=1683049793;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=twCPC0pauRSrcDGPcatZZnRn4es+o8hDMAtgf21b8Ls=;
        b=dj6rIRGAeyaAqpafkVvG8Bs1QYUcHlXahGt7AC/epIgP0MMiWp0gw9iW7PWV8S2yAp
         hQDznaRi3PR9WYofV/IF/BXrWTOaXiZnLG5qpfAwAiz5BKkjoJhzmcT1tK63U+5Dx0n9
         R/zLMy86vABq4fXTYuI7S4COvqXshza8g7zipd2HWTaWYx03KuEVXsXz3qwIusmioa+J
         s8mP63WLzvH9RCUCLPIpqxEOwshiKf0yE5mapiJcywjf9zA++aEZAjJnyrYRLegvgmfb
         kv4XrvAogkOefZrVstyLnGiC0lVsQvE/Pu8YQxWLs0Am7lEdBMX0PrjBvp3b1sxOW68v
         nU+Q==
X-Gm-Message-State: AAQBX9ciCV7yP47GH09IOXMZZJGuBIfHCIv7ftUE+GGacwjE+v+8m9WO
	0zcM29q1ALjW4XEk+asEceqvstOL2Gt0nHnEUR4=
X-Google-Smtp-Source: AKy350ZUoMZ9u7awuLWHV/KQn0xMMtKoCfIg6dyJPK2MVx5AYtXjbK21QezKF/tt+KIoH4si9vhIew==
X-Received: by 2002:a17:906:3590:b0:8b1:75a0:e5c6 with SMTP id o16-20020a170906359000b008b175a0e5c6mr34710593ejb.18.1680457793481;
        Sun, 02 Apr 2023 10:49:53 -0700 (PDT)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id j18-20020a508a92000000b005029c47f814sm984084edj.49.2023.04.02.10.49.52
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Apr 2023 10:49:52 -0700 (PDT)
Received: by mail-ed1-f47.google.com with SMTP id t10so108587607edd.12
        for <regressions@lists.linux.dev>; Sun, 02 Apr 2023 10:49:52 -0700 (PDT)
X-Received: by 2002:a05:6402:e93:b0:502:a4ec:a225 with SMTP id
 h19-20020a0564020e9300b00502a4eca225mr436161eda.4.1680457792538; Sun, 02 Apr
 2023 10:49:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <168045676522.992122.1074253542608037015@leemhuis.info>
In-Reply-To: <168045676522.992122.1074253542608037015@leemhuis.info>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 2 Apr 2023 10:49:35 -0700
X-Gmail-Original-Message-ID: <CAHk-=whRs_MavKCqtV3=K31dq9Z6HzbaG8Uxo-EV=uRxdsXduA@mail.gmail.com>
Message-ID: <CAHk-=whRs_MavKCqtV3=K31dq9Z6HzbaG8Uxo-EV=uRxdsXduA@mail.gmail.com>
Subject: Re: Linux regressions report for mainline [2023-04-02]
To: "Regzbot (on behalf of Thorsten Leemhuis)" <regressions@leemhuis.info>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 2, 2023 at 10:34=E2=80=AFAM Regzbot (on behalf of Thorsten
Leemhuis) <regressions@leemhuis.info> wrote:
>
> But there is a 6.2 regression that annoys me. It's one of the two in the
> media driver venus I mentioned a few times already in earlier reports.

Ok, something is rotten in the state of Denmark^Hmedia.

I've taken that revert directly, the same way I had to take Arnd's
build fix. Both patches from way back on February 7.

Oh well.

                   Linus
