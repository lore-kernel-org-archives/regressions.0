Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0233C32
	for <regressions@lists.linux.dev>; Tue, 11 Oct 2022 17:28:39 +0000 (UTC)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 437C13F481
	for <regressions@lists.linux.dev>; Tue, 11 Oct 2022 17:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1665508771;
	bh=my6sVOU8VtRYMa675sr9CNOS9J5JEpSv1gx/NSSrwBI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=ihB/HABPk5WS1QxpMam+eSfj+vmPxd+7ZJvdjoTbWo0U3ZqjazDnvZa7QJZvYjgdN
	 sSNehad9fdxFSwWJocOfhvyrM1bhflM7AK3vfff6OsRy+/+IduPLIgQFWOjeumv17j
	 9o568MEf9knwRH2qH3ajHM62GHEbSu4pVbELW27kY5ayhe0G1GCKAJJlX5q+a7Owfc
	 Mt5XF7gtH7cOuST2I5MyncWnaH+UxXf8y0ei3Y9qT3NnW3s/sQOvOPulyDePtQO2Lc
	 82df5DMVrISUfdmjoIljWuRaGM23Gk9SfEG5/L76T7grpeedoUIT4XdyLEujOS2aM7
	 ktIp5q4+V9Cqg==
Received: by mail-wm1-f70.google.com with SMTP id q14-20020a7bce8e000000b003c6b7debf22so1324233wmj.0
        for <regressions@lists.linux.dev>; Tue, 11 Oct 2022 10:19:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=my6sVOU8VtRYMa675sr9CNOS9J5JEpSv1gx/NSSrwBI=;
        b=AgD0Cgh1/bB9eGYftbDKbBQuO5sxclYJKje+EgZwwOqWDBF9MI2A1qLKUOdelMWFAr
         uWD2BT4t8uQoTerc6M1lR2mX+v3bD5s6mxdguOiNzRHRx4D/KKw6XEzmj2XHIA8nnC1O
         Ekp2Y0v7dWBSwhfwFJncF6SmUbGJxdMhCZhBh/NqVCR7nFt8n7eis272lUkT6Bqresn+
         DghKxgf6blTU4Vd0fpsNc1UsVEeWQhmn8xoqA2ZqS0i3bN/WfWPWS1iW0cD4MwHiblRU
         0EUtF9wXdHkm3VaOrhDTLBLjnzZK81NBTasO6m9nwbYyfKOGThD6u7QVEUn328s3wbRl
         726A==
X-Gm-Message-State: ACrzQf19g6ZI6Xp7Hl2TecdTksvR3Lci7HpDc9xx/WwC9ZPQxcar0gMp
	9bthCNC41B4JyjZkue1aerPMbmEbqKgdnpWppYyylr7URUXgHZng1KgZJY53AN4yGY+t8sZ6T+u
	wzDDPMZC9ZtgYN8L0DFfDCyU5pon1O59ErRvUbwzSZug1XdWQ+ktBSGnn
X-Received: by 2002:a05:600c:418b:b0:3c6:c1e6:b01c with SMTP id p11-20020a05600c418b00b003c6c1e6b01cmr113411wmh.118.1665508770791;
        Tue, 11 Oct 2022 10:19:30 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6kEfxTPdaaZb76dTujH+ZaW2WgqT1q11a8LoW5U3WyutzRoB267icZUKz0P9CQZnC7l3DX49bwGyxx6kmMa2k=
X-Received: by 2002:a05:600c:418b:b0:3c6:c1e6:b01c with SMTP id
 p11-20020a05600c418b00b003c6c1e6b01cmr113396wmh.118.1665508770566; Tue, 11
 Oct 2022 10:19:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <d6c9e249-08bd-4439-7dcc-371b32e7b851@canonical.com> <Y0WgwBgenhnk7/O2@spud>
In-Reply-To: <Y0WgwBgenhnk7/O2@spud>
From: Dimitri John Ledkov <dimitri.ledkov@canonical.com>
Date: Tue, 11 Oct 2022 18:18:54 +0100
Message-ID: <CADWks+Y3xYc325x2_2jeRh-iyE6i0gi2Ldd_KKBLhB7s9nQhWA@mail.gmail.com>
Subject: Re: Regression: Fwd: Re: [PATCH] riscv: mmap with PROT_WRITE but no
 PROT_READ is invalid
To: Conor Dooley <conor@kernel.org>
Cc: regressions@lists.linux.dev, stable@vger.kernel.org, 
	Eva Kotova <nyandarknessgirl@gmail.com>, linux-riscv@lists.infradead.org, 
	coelacanthus@outlook.com, kernel-team@lists.ubuntu.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 11 Oct 2022 at 17:58, Conor Dooley <conor@kernel.org> wrote:
>
> On Tue, Oct 11, 2022 at 05:52:13PM +0100, Dimitri John Ledkov wrote:
> > #regzbot ^introduced 2139619bcad7ac44cc8f6f749089120594056613
> >
> > Over at https://lore.kernel.org/linux-riscv/Yz80ewHKTPI5Rvuz@spud/T/#ebde47064434d4ca4807b4abb8eb39898c48a8de2
> > it is reported that 2139619bcad7ac44cc8f6f749089120594056613
> > regresses userspace (openjdk) on riscv64.
> >
> > This commit has already been released in v6.0 kernel upstream,
> > but has also been included in the stable patch series all the
> > way back to v4.19.y
> >
> > There is a proposed fix for this at
> > https://lore.kernel.org/linux-riscv/20220915193702.2201018-1-abrestic@rivosinc.com/
> > which has not yet been merged upstream or in stable series.
> >
> > Please review and merge above proposed fix, or please revert
> > 2139619bcad7ac44cc8f6f749089120594056613 to stop the regression
> > spreading to all the distributions.
>
> Out of curiosity, and given the CC list lacks a CC of the maintainer,
> who are you actually asking to review and/or merge this?
>

Good point, this is my first time escalating a regression which is now
in all the stable trees. I guess I should have CC'ed all the M: from
RISC-V in the Maintainers file. Not just the riscv list.

> I'll go bump the fix itself.

Thanks.

>
> Thanks,
> Conor.
>
> >
> > In Ubuntu this regression will be tracked as https://bugs.launchpad.net/bugs/+bug/1992484
> >
> > -------- Forwarded Message --------
> > Subject: Re: [PATCH] riscv: mmap with PROT_WRITE but no PROT_READ is invalid
> > Date: Thu, 6 Oct 2022 22:20:02 +0300
> > From: Eva Kotova <nyandarknessgirl@gmail.com>
> > Reply-To: PH7PR14MB559464DBDD310E755F5B21E8CEDC9@PH7PR14MB5594.namprd14.prod.outlook.com
> > To: coelacanthus@outlook.com
> > CC: c141028@gmail.com, dramforever@live.com, linux-riscv@lists.infradead.org, palmer@dabbelt.com, xc-tan@outlook.com
> >
> > On Tue, 31 May 2022 00:56:52 PDT (-0700), coelacanthus@outlook.com wrote:
> > > As mentioned in Table 4.5 in RISC-V spec Volume 2 Section 4.3, write
> > > but not read is "Reserved for future use.". For now, they are not valid.
> > > In the current code, -wx is marked as invalid, but -w- is not marked
> > > as invalid.
> >
> > This patch breaks OpenJDK/Java on RISC-V, as it tries to create a w-only
> > protective page:
> >
> > #
> > # There is insufficient memory for the Java Runtime Environment to continue.
> > # Native memory allocation (mmap) failed to map 4096 bytes for failed to
> > allocate memory for PaX check.
> > # An error report file with more information is saved as:
> > # /root/hs_err_pid107.log
> >
> > I bisected to this commit since on Linux 5.19+ java no longer works.
> > Perhaps some fallback should be implemented, to prevent userspace
> > breakage. It is currently documented, that at least on i386 PROT_WRITE
> > mappings imply PROT_READ (See man mmap(2) NOTES), this would be a good
> > place to start.
> >
> > Best regards,
> > Eva
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
> >
>
>
>


-- 
okurrr,

Dimitri
