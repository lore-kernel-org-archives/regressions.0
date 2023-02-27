Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3268779EF
	for <regressions@lists.linux.dev>; Mon, 27 Feb 2023 20:07:08 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id cy6so30724137edb.5
        for <regressions@lists.linux.dev>; Mon, 27 Feb 2023 12:07:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3oqSuHyd58upkN+REe6cNpWdbGmeGTPNZYBxYA3mJCI=;
        b=QNq5ZFOBMWMe087lgTL0w/9PiBLy3Nqgwhna58XI6PQXysMgseTVTYmKejL+jeRj6j
         LelmxO5Bq2l/Ve5cGo4Y55I8VkmuHqpaJv/KH+UyDNN2QSR+eFT7p9LBG6z6Az7Y9+Sx
         PZvVkULrHJM3qoerf5FLEgJVvwSUyWSeZz22g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3oqSuHyd58upkN+REe6cNpWdbGmeGTPNZYBxYA3mJCI=;
        b=Xp2ND6W/z0k434S2ON4PhJV1l4sVAJzT3pQ/YbVxnGMdep6ACq9Cg9jhmpyKrH3GWu
         ASeqtxOzAAkMIunGjVvEYUbObCm+Gl1zlRuSdsy2vRg3wwKqMXucaGWMTrWxDnFpW5XC
         FBUVYZBkBAH7cBYBblkBJEOTzG16HAg0e8xK/qefDWziIf/jM08nPR27/6aXPYI2siQw
         MHQ1BGVAfO4IFnJtsBdhJi++nCPtVAoUZhzGddKnXGABxbOfHOZGqoZYASCgQzJio3Eo
         qdwmh5W1fTy678mQ7FbMbPtMRXRTdhPbyfsmBngqmF8LpGa7AA7EvWaJL1TVFItJyfU1
         fvdA==
X-Gm-Message-State: AO0yUKVDunAJ4XaxOf7Q8Ff2RF5WFmaQ0wbAEgnrIzp21c09vvLBkdf/
	ydldKRxY4ITbcExZwOkeSlFrl1CAokXseNmpAXk=
X-Google-Smtp-Source: AK7set99eqPhcdLbKh4OyTFxPP9O8G/WWB5QMaVMSr+BMVZVE8siBskF0BmgwHe4CRhnDdJV6IsLxg==
X-Received: by 2002:a17:906:4910:b0:8b1:7de0:c854 with SMTP id b16-20020a170906491000b008b17de0c854mr33738094ejq.41.1677528426013;
        Mon, 27 Feb 2023 12:07:06 -0800 (PST)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id e12-20020a1709061e8c00b008d1693c212csm3532747ejj.8.2023.02.27.12.07.04
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Feb 2023 12:07:05 -0800 (PST)
Received: by mail-ed1-f53.google.com with SMTP id o12so30623053edb.9
        for <regressions@lists.linux.dev>; Mon, 27 Feb 2023 12:07:04 -0800 (PST)
X-Received: by 2002:a17:906:8508:b0:8d0:2c55:1aa with SMTP id
 i8-20020a170906850800b008d02c5501aamr13023299ejx.0.1677528424547; Mon, 27 Feb
 2023 12:07:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1677527001-17459-1-git-send-email-george.kennedy@oracle.com>
In-Reply-To: <1677527001-17459-1-git-send-email-george.kennedy@oracle.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 27 Feb 2023 12:06:47 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjaz=muuHR-bS9KfELeMf56z1BS2ecB9isAKxf0EwqCYQ@mail.gmail.com>
Message-ID: <CAHk-=wjaz=muuHR-bS9KfELeMf56z1BS2ecB9isAKxf0EwqCYQ@mail.gmail.com>
Subject: Re: [PATCH] vc_screen: modify vcs_size() handling in vcs_read()
To: George Kennedy <george.kennedy@oracle.com>
Cc: jirislaby@kernel.org, gregkh@linuxfoundation.org, sfr@canb.auug.org.au, 
	akpm@linux-foundation.org, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux@weissschuh.net, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 27, 2023 at 11:43=E2=80=AFAM George Kennedy
<george.kennedy@oracle.com> wrote:
>
> Restore the vcs_size() handling in vcs_read() to what
> it had been in previous version.
>
> Suggested-by: Jiri Slaby <jirislaby@kernel.org>
> Signed-off-by: George Kennedy <george.kennedy@oracle.com>

Please also add a

   Fixes: 226fae124b2d ("vc_screen: move load of struct vc_data
pointer in vcs_read() to avoid UAF")

or whatever it was that broke this, so that we have that context to
what the "previous version" actually was.

               Linus
