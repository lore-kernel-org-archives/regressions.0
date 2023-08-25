Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C784C2FF
	for <regressions@lists.linux.dev>; Fri, 25 Aug 2023 11:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692963808;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yK2aJ/cxFzTH60S+l1UWL+t/xPmgIFhT2EXCNNWwwqA=;
	b=IyWG6rS24Sf2oywlW6k9wBa+Tjek7fDsJl+aMh5Z5dKC2pAA0075udAsWeMz1HMS3X7bf7
	MVEmB8WNZXu1o///nuToF8JBuABIppoGB7OjZuhH5FslQYV4r6u3vGqPV0+ljDyvXi8U3S
	Fs2E0bLHrWvRoSY0jI79voHNDjzuBks=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-687-iG6dNpGaNBa8iq8bdH97kQ-1; Fri, 25 Aug 2023 07:43:27 -0400
X-MC-Unique: iG6dNpGaNBa8iq8bdH97kQ-1
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-3a7d402fc85so895901b6e.3
        for <regressions@lists.linux.dev>; Fri, 25 Aug 2023 04:43:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692963806; x=1693568606;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yK2aJ/cxFzTH60S+l1UWL+t/xPmgIFhT2EXCNNWwwqA=;
        b=Md89VAAjOigjiy+vs/PFKaleRsWZBcJjDMJdNtAD5UtUJccsyk2aHbOC48EgKGqsB4
         es+/mYdgvrMZgHAQT1b8bnQcEXuoGZSk2+Y4ClmwFcg+lqkdhzGBwr4Ut/o/3bZ6p+AH
         JewNy/1+UweDyU6IZmitrh9R3x33tPjjzsZUzGg7B9oDxiljB8ZZ+1M3ho+fIVbjnYAz
         6TsKc3f30ugNcJaShDnbTr1FXWHfaOVN7v9Q0797SFg828+FLQD5i6R9FgmvNuLBHQMH
         5insMAox9WdlWyuRyPTzRjNFXkdJEl7CS9ECavtGYQ4T/rfQfCTsF6mpJnUqbUJauBtN
         qCNg==
X-Gm-Message-State: AOJu0Yz1MnodscWHKR+BOh/1gQIADUJXPwVG1J/chrgDt1mtS5139Xa/
	Ha5PjZKseJobJfNAt33YddiYI64QSPWtX/0cV2jv/1WflL2usrHWt2+LZCEnnBEJTR4xXjdyVrN
	J+zetMMhFpczapwZAEb0iOXxwbg0my/A61PzqkQ==
X-Received: by 2002:aca:2315:0:b0:3a7:55f2:552d with SMTP id e21-20020aca2315000000b003a755f2552dmr2288553oie.58.1692963806344;
        Fri, 25 Aug 2023 04:43:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+xJ5q9lkDG0Kt/Qn4o5FYDLr4miNIx8Cg7jyKqQ/ConFqjLbuMWXf8VkN8weihHm3wZiN+2PbsDpxFO+pGs8=
X-Received: by 2002:aca:2315:0:b0:3a7:55f2:552d with SMTP id
 e21-20020aca2315000000b003a755f2552dmr2288546oie.58.1692963806182; Fri, 25
 Aug 2023 04:43:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+cBOTc-7U_sumg6g-uBs9w3m8xipuOV1VY=4nmBcyuppgi8_g@mail.gmail.com>
 <20230823050714.GP3465@black.fi.intel.com> <CA+cBOTdS5djXL=93VThP9K67pjYKHtjceqSczKf8NQonhpgo5Q@mail.gmail.com>
 <20230823074447.GR3465@black.fi.intel.com> <20230823075649.GS3465@black.fi.intel.com>
 <CA+cBOTco17b_8ZMhU8gXy8z2mtZXvVxrEUdKaAuZMhyFYC3yeQ@mail.gmail.com>
 <20230823090525.GT3465@black.fi.intel.com> <CA+cBOTeOSBkw_-AM6desmdVQjTXUZbKppK_PDiOM3sXQW5QKiA@mail.gmail.com>
 <20230824114300.GU3465@black.fi.intel.com> <CA+cBOTej22hWEFvMOnFfKy16tuzS_+S7kccPPYXNoGVbYMoEdA@mail.gmail.com>
 <20230825094646.GC3465@black.fi.intel.com>
In-Reply-To: <20230825094646.GC3465@black.fi.intel.com>
From: Kamil Paral <kparal@redhat.com>
Date: Fri, 25 Aug 2023 13:42:59 +0200
Message-ID: <CA+cBOTeaizTbPibweo3u0zSrY_jNsbttidhUD7OQgHZ5xUB=TA@mail.gmail.com>
Subject: Re: [REGRESSION] resume with a Thunderbolt dock broke with commit
 e8b908146d44 "PCI/PM: Increase wait time after resume"
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-pci@vger.kernel.org, regressions@lists.linux.dev, 
	bhelgaas@google.com, chris.chiu@canonical.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 25, 2023 at 11:46=E2=80=AFAM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> I would start by contacting Lenovo because I suspect this is Thunderbolt
> firmware (host side not dock) issue so they may pull a newer one for
> this one from Intel.

Thanks. For anyone who wants to follow this, I did that in my
downstream bug report here:
https://bugzilla.redhat.com/show_bug.cgi?id=3D2230357#c23

Thanks again for all your help.
Kamil P=C3=A1ral

