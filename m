Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791E4525A
	for <regressions@lists.linux.dev>; Tue, 15 Aug 2023 06:29:02 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-4ff88239785so198610e87.0
        for <regressions@lists.linux.dev>; Mon, 14 Aug 2023 23:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1692080940; x=1692685740;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ludy8s71/IVequuRzsey/0aGXZOas5qhy1/o2Tc5egU=;
        b=R9HJDB3o2BKpiuDxOVG83IJyv8w8Tp4qjYRcn1F+t0LmvM/uIGFT8rq0O4QwLXu7Qq
         OtcXdsTcaf5r1a5UmoQCj3Pti1Rp/j2Ewr05MClnPRjEo7eJEtyRbQgGU8ARmpELtRHI
         ve8abFSll7ZVVPGNGpkCzXAPV1nJaCmWU0YZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692080940; x=1692685740;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ludy8s71/IVequuRzsey/0aGXZOas5qhy1/o2Tc5egU=;
        b=YonMlaqjouKB66ls5V7pI9b+pidzrJZkSL3riNJt64uS3pfsXXldiKxt2eyNdSQyHj
         19/H6K9VLffm02FF2Zmh8RsTCcZ1N29ptuvHCpJ7+oKvWwa4M55ojyoG6nb5R6AveJMt
         ppZhbpvmnTadXnDj+9mwebZNr4qiOx68eOygGZ1OZdOwACfkbuJ+ZVcSCeuAOW0RgYm6
         YAEzSCXglWbd6vmRaOdFezq7Jx/Dp0PptSK36qK3jlRQ4XFmLuPqee5uSwCnx6t7115q
         yb9zfBmKnBZbKhhuvBNe0p1QhkdprVbRtMKoaiU9JwUKw/S1Ow9RoI0KTKbciSkvWwsA
         q3Jg==
X-Gm-Message-State: AOJu0YyBxI3297K/LA9KH7I4NWv0Jv6HC+Wv1NV8FA2PqN4AILo/esnZ
	BIE/m1Vc+2nHM9gvtLqdCPO68CUvAJ+uiKJTe9PDUg==
X-Google-Smtp-Source: AGHT+IENZt6zQptdu1ikcyVIC6zIJS3Nq92rTR1edu8RLJP/MARNsDWSY21SV8ogIee8nIWC5n97AQ==
X-Received: by 2002:a05:6512:74d:b0:4fd:8976:5fc9 with SMTP id c13-20020a056512074d00b004fd89765fc9mr6627454lfs.23.1692080939991;
        Mon, 14 Aug 2023 23:28:59 -0700 (PDT)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com. [209.85.167.41])
        by smtp.gmail.com with ESMTPSA id c5-20020ac25305000000b004ff7e742143sm372739lfh.61.2023.08.14.23.28.58
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Aug 2023 23:28:58 -0700 (PDT)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-4fe1b00fce2so7574402e87.3
        for <regressions@lists.linux.dev>; Mon, 14 Aug 2023 23:28:58 -0700 (PDT)
X-Received: by 2002:a05:6512:60a:b0:4fe:ae7:d906 with SMTP id
 b10-20020a056512060a00b004fe0ae7d906mr6932731lfe.65.1692080938440; Mon, 14
 Aug 2023 23:28:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+prNOpqd2Tk1tiBAa9MT6ZPxB5gj9ftxOhaZ-u1WEay9H-oHQ@mail.gmail.com>
 <20230815053132.GB22301@1wt.eu> <CA+prNOrUVWM9-vozUZyW49-m=qFWZR3JAtikZb4T1EimV0ZCDw@mail.gmail.com>
In-Reply-To: <CA+prNOrUVWM9-vozUZyW49-m=qFWZR3JAtikZb4T1EimV0ZCDw@mail.gmail.com>
From: Linus Torvalds <torvalds@linuxfoundation.org>
Date: Tue, 15 Aug 2023 06:28:41 +0000
X-Gmail-Original-Message-ID: <CAHk-=wgDbr7dw0GP4zEkPu5X2mME3YH9t0+cP8Avs3m0KZxbCQ@mail.gmail.com>
Message-ID: <CAHk-=wgDbr7dw0GP4zEkPu5X2mME3YH9t0+cP8Avs3m0KZxbCQ@mail.gmail.com>
Subject: Re: A small bug in file access control that all have neglected
To: Xuancong Wang <xuancong84@gmail.com>
Cc: Willy Tarreau <w@1wt.eu>, security@kernel.org, stable@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, 15 Aug 2023 at 06:11, Xuancong Wang <xuancong84@gmail.com> wrote:
>
> Yes, by "full access", I mean `chmod 777`. You can easily reproduce
> this bug on any Linux machine by typing the following commands:

This is how things are supposed to work. The 0777 permissions mean
that you can read, write and execute the file. They do not mean that
you own the file.

As a non-owner, you can set the access and modification times  the
same way you could by just reading and writing to the file. So if you
set mtime, you have to set ctime ("change time") too.

To actually change times arbitrarily and with other patterns, you need
to actually own the file.

             Linus
