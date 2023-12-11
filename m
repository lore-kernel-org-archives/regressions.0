Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53EF51F612
	for <regressions@lists.linux.dev>; Mon, 11 Dec 2023 08:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F0THMvF0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702283943;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1+rpkHLACLDXnopUhV4Darz1lN4kx+KCDi/816Bv8UY=;
	b=F0THMvF05fmS3vQIOG/RivUgrDzdi7Q1bSkUvYlreO/aoPKtywV8WQhiWBeGOmvuNyWEsI
	AR7VnXc4QKcnhbWZycjQz1xNisCVSbeU+OTkWElcRp4v204YE/iSWxseODQedw0hDBsSKd
	+5jhEF2ax4jvmRr/GF1JaxbIsP7qbYc=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-67-AFq5qdGnNr2xM4q0dfKC4g-1; Mon, 11 Dec 2023 03:39:01 -0500
X-MC-Unique: AFq5qdGnNr2xM4q0dfKC4g-1
Received: by mail-yb1-f197.google.com with SMTP id 3f1490d57ef6-db54c11887aso4584836276.1
        for <regressions@lists.linux.dev>; Mon, 11 Dec 2023 00:39:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702283941; x=1702888741;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1+rpkHLACLDXnopUhV4Darz1lN4kx+KCDi/816Bv8UY=;
        b=e3ZxmC74/xPNtm1CbyDwkrRKeWN9RouCozpwTY7YViNWsuEAEeMOuSSWse1ryCLlze
         MhmKycogX98xYgZJPnC/51BB42Bgai1dQDESYx6v845HHBB0JmOWEa9li/ig6BVdhKym
         KpWZ4vPMiA9oxG47i69NTjVL2P0DVET3SlG33mcZOGAo0ivzHikL+jL7nTDMs5HBS2EG
         4htfYOCuRkgqKFG+BiHwrrRy3D0dwrLhZmL09papgwrOv4wvW2UcEXgEbWdtJZyt/4Dl
         NRYWduwGWvA8FTfDA0VR9LsYUiyUjDwazrnUh6Bt9LSvPDUQ2ODhlhp7z77uar2nRuIv
         y5bg==
X-Gm-Message-State: AOJu0YzXWo7oRUztSRkAhRroY/DWU0kAzUhn9wwRBtsXIG2hNa2acMb2
	pJH4b9dSDwyavvPhoSRdInDi+lkT+t5R/QPqxH9eFQf8UVDrtAG03aCDmVWSDj2YK43d/Fh1Pk4
	aDFb5PzOV7DKA+PFqiAoJSFeHmnz1tfWRIItTvqA=
X-Received: by 2002:a25:68c1:0:b0:db7:dad0:60c3 with SMTP id d184-20020a2568c1000000b00db7dad060c3mr2614111ybc.80.1702283941301;
        Mon, 11 Dec 2023 00:39:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFUz/nHnLJWAaFLm8izYaYXF4GTzlJ4XVDA8lvukk09HLQoqtuIUDso/21nYhEpGmUuXQ1ChW05eo4VX/XCsxA=
X-Received: by 2002:a25:68c1:0:b0:db7:dad0:60c3 with SMTP id
 d184-20020a2568c1000000b00db7dad060c3mr2614106ybc.80.1702283941008; Mon, 11
 Dec 2023 00:39:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CACW2H-4FpZAizkp+U1aS94V_ODn8NUd1ta27BAz_zh0wo63_rQ@mail.gmail.com>
In-Reply-To: <CACW2H-4FpZAizkp+U1aS94V_ODn8NUd1ta27BAz_zh0wo63_rQ@mail.gmail.com>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Mon, 11 Dec 2023 09:38:49 +0100
Message-ID: <CAGxU2F6C8oUY4B38y17Ti9u9QdYqQKamM+S2nofjYe5b9L1tBQ@mail.gmail.com>
Subject: Re: [REGRESSION] vsocket timeout with kata containers agent 3.2.0 and
 kernel 6.1.63
To: Simon Kaegi <simon.kaegi@gmail.com>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev, 
	Bobby Eshleman <bobby.eshleman@bytedance.com>, "David S. Miller" <davem@davemloft.net>, 
	Sasha Levin <sashal@kernel.org>, jpiotrowski@linux.microsoft.com, 
	Michael Tsirkin <mst@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 11, 2023 at 5:05=E2=80=AFAM Simon Kaegi <simon.kaegi@gmail.com>=
 wrote:
>
> #regzbot introduced v6.1.62..v6.1.63
> #regzbot introduced: baddcc2c71572968cdaeee1c4ab3dc0ad90fa765
>
> We hit this regression when updating our guest vm kernel from 6.1.62 to
> 6.1.63 -- bisecting, this problem was introduced
> in baddcc2c71572968cdaeee1c4ab3dc0ad90fa765 -- virtio/vsock: replace
> virtio_vsock_pkt with sk_buff --
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?=
h=3Dv6.1.63&id=3Dbaddcc2c71572968cdaeee1c4ab3dc0ad90fa765
>
> We're getting a timeout when trying to connect to the vsocket in the
> guest VM when launching a kata containers 3.2.0 agent. We haven't done
> much more to understand the problem at this point.

It looks like the same issue described here:
https://github.com/rust-vmm/vm-virtio/issues/204

In summary that patch also contains a performance improvement, because
by switching to sk_buffs, we can use only one descriptor for the whole
packet (header + payload), whereas before we used two for each packet.
Some devices (e.g. rust-vmm's vsock) mistakenly always expect 2
descriptors, but this is a violation of the VIRTIO specification.

Which device are you using?

Can you confirm that your device conforms to the specification?

Stefano

>
> We can reproduce 100% of the time but don't currently have a simple
> reproducer as the problem was found in our build service which uses
> kata-containers (with cloud-hypervisor).
>
> We have not checked the mainline as we currently are tied to 6.1.x.
>
> -Simon
>

