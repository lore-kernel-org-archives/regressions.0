Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FEBDBA2F
	for <regressions@lists.linux.dev>; Thu,  1 Jun 2023 12:26:49 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5147f4bbfdaso1226658a12.0
        for <regressions@lists.linux.dev>; Thu, 01 Jun 2023 05:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1685622407; x=1688214407;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PJAjrSKk1Ndk8NS3+84Nyv09lcJ/qTEF//Jjgbbt0wY=;
        b=LGLOY87tAQB5Ec3Y/8e9bnJnLtd/lGFTHfUqGHlZ1neCaUmqu9e4KFMZ1Q07UdBUiS
         CdiBESxy9kRbLeq0zuqkHlalm6ndly4hQ8f4MQzhITWaxsDa6sOghru+QBRhIC7SPWq9
         XayY6yOukqd5rQWFrGOCL45YmEWSNMjxMMW2w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685622407; x=1688214407;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PJAjrSKk1Ndk8NS3+84Nyv09lcJ/qTEF//Jjgbbt0wY=;
        b=T2xqiQd58HPSmZoyOd97ZWl+FfVI0YadErZ2Rh6UJVB7yTiWqUD7b2+x69vaXOVi5e
         bLGmpJCEWLNtkxyskI9h8IOrGR0LLa6XC+b/zcazRkNtnW26vbW9gnyn2X/hpmFXbSss
         NddxqP3CR6uhUntThuRtoafEiwhxaeYVp1n3LLd8XtYlhBUapvLh0XtovBFzTP4PpveP
         wBfGwx9ZwpWUr3cOTSNC376H7fT4b8LMRli2pLFPcVwav3XK9xlgfK3gnWdUE8YJhVbT
         8LTLZDSxE3ejzELmWKN86M9znLnP1pJZ9t2XvwmqoEXuSu9N0Ld4m3exagyRPqJrW61L
         jWhw==
X-Gm-Message-State: AC+VfDzmjGi66VIvoatJcYlUV7YJzjI8Mvwin0XprE0ytbqZBGn+2Lli
	+qcI2X6ruIXfFLnM03kdwIcD5tEM+vhEDdqFNTmNUoMh
X-Google-Smtp-Source: ACHHUZ4wQEAvFCb5GeLs3ruGDp29F49KD804e/s6fVevh+1S1ZqbqAifaW+SrGwnKuYucHMlDthcKQ==
X-Received: by 2002:aa7:ce0c:0:b0:514:9422:37db with SMTP id d12-20020aa7ce0c000000b00514942237dbmr5573461edv.39.1685622407450;
        Thu, 01 Jun 2023 05:26:47 -0700 (PDT)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id h9-20020a50ed89000000b0050bca43ff55sm7047649edr.68.2023.06.01.05.26.46
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Jun 2023 05:26:46 -0700 (PDT)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-96f5685f902so101859566b.2
        for <regressions@lists.linux.dev>; Thu, 01 Jun 2023 05:26:46 -0700 (PDT)
X-Received: by 2002:a17:907:9412:b0:973:daa0:315 with SMTP id
 dk18-20020a170907941200b00973daa00315mr8333457ejc.1.1685622406136; Thu, 01
 Jun 2023 05:26:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230519-vormittag-dschungel-83607e9d2255@brauner>
 <ab8c9f95-c9e9-de04-4e28-78163a32da80@leemhuis.info> <20230601-herzallerliebst-dschungel-4515db351a0c@brauner>
In-Reply-To: <20230601-herzallerliebst-dschungel-4515db351a0c@brauner>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 1 Jun 2023 08:26:29 -0400
X-Gmail-Original-Message-ID: <CAHk-=wgQAgHh_rjiFaAO+Y_mRQvp4SJ7SQ7niVKj89hDmh8Q_A@mail.gmail.com>
Message-ID: <CAHk-=wgQAgHh_rjiFaAO+Y_mRQvp4SJ7SQ7niVKj89hDmh8Q_A@mail.gmail.com>
Subject: Re: [RFC PATCH 0/8] vhost_tasks: Use CLONE_THREAD/SIGHAND
To: Christian Brauner <brauner@kernel.org>
Cc: Thorsten Leemhuis <linux@leemhuis.info>, Mike Christie <michael.christie@oracle.com>, oleg@redhat.com, 
	nicolas.dichtel@6wind.com, axboe@kernel.dk, ebiederm@xmission.com, 
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org, 
	mst@redhat.com, sgarzare@redhat.com, jasowang@redhat.com, stefanha@redhat.com, 
	Linux kernel regressions list <regressions@lists.linux.dev>, hch@infradead.org, konrad.wilk@oracle.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 1, 2023 at 6:47=E2=80=AFAM Christian Brauner <brauner@kernel.or=
g> wrote:
>
> @Mike, do you want to prepare an updated version of the temporary fix.
> If @Linus prefers to just apply it directly he can just grab it from the
> list rather than delaying it. Make sure to grab a Co-developed-by line
> on this, @Mike.

Yeah, let's apply the known "fix the immediate regression" patch wrt
vhost ps output and the freezer. That gets rid of the regression.

I think that we can - and should - then treat the questions about core
dumping and execve as separate issues.

vhost wouldn't have done execve since it's nonsensical and has never
worked anyway since it always left the old mm ref behind, and
similarly core dumping has never been an issue.

So on those things we don't have any "semantic" issues, we just need
to make sure we don't do crazy things like hang uninterruptibly.

            Linus
