Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14722F38
	for <regressions@lists.linux.dev>; Wed, 11 Jan 2023 15:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673452354;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=ryrrVULoscZ1riSGOM9SabdXBEw/UV56TVFRHhdk8Hk=;
	b=OeG/wFkoFBUl7kBMrY3aX6Q7SHhR2FsIkPoFWljbStLgdBSGkYfQK/1Wb2RGYLOlqDf3cB
	TcFL+f7PdeMRZAVErvKIiI51T+AtMUnou2ugOgp+7JrErtFNg7X/UEl5lUs0TMwHJlwkhC
	7lHsgvHkvb5/zWJfTCdEyL0UClTMjdU=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-8-2PUzgezaMKuXBbAPVouo_Q-1; Wed, 11 Jan 2023 10:52:33 -0500
X-MC-Unique: 2PUzgezaMKuXBbAPVouo_Q-1
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-4c2d68b6969so154790617b3.7
        for <regressions@lists.linux.dev>; Wed, 11 Jan 2023 07:52:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ryrrVULoscZ1riSGOM9SabdXBEw/UV56TVFRHhdk8Hk=;
        b=xRjUbiZEJn55SrgqdmbU28tZItEQk8MXcV2WYPTBHN+DDkJmalRtdng1gpi1nTaTzN
         KrkMOZ9G5urY7s9H1KQjBKqvS/ZAYn1cpluebTNJ+GehvBZw5a9q4goUDb7ErDo9IuQ2
         2IT5r6KcS1yxlvHWi8BWEKR+JHicw++7gtYySMx5i38vVwysPbaziCTx7FJ0qXz2gTqM
         kh7A48QZ+dKAiA/TowbnyJLvX+RPzmLQDCMfjQY4Ojxr1vAIe9ZcE7vD5N+Gg04NBvaf
         aoN9pM2XHtwVVMef7b8UzRDRFog+siFm9SBB8xmMEFE6dTr9U4GoOIDkcj4blkinCzV9
         ruSQ==
X-Gm-Message-State: AFqh2koMRjkuzwMCfttfoAOJ861bBZGgd5Qg5RCPK4jRWDh7g50YV2Nq
	t60anOm2cW5YuFM6+au6cj1afQwf4rhzKYfaQiZN4iKcbG0wOon36yjseRoPWL+/UrvxFr2Qdng
	lCRwels3gihGR0X33c+8+z/EliUFO6vPl6ZSMGTc=
X-Received: by 2002:a05:690c:fd5:b0:4a4:7135:9214 with SMTP id dg21-20020a05690c0fd500b004a471359214mr6355352ywb.378.1673452352788;
        Wed, 11 Jan 2023 07:52:32 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtStWXR+38RfXxzFTVMcf7hzA0i9hXKSpLyfi0CZB2+pYusTRUJDWvXhu+YWgsAtexBs1T/Ku+QZ43JZuHtbu8=
X-Received: by 2002:a05:690c:fd5:b0:4a4:7135:9214 with SMTP id
 dg21-20020a05690c0fd500b004a471359214mr6355349ywb.378.1673452352610; Wed, 11
 Jan 2023 07:52:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Paul Holzinger <pholzing@redhat.com>
Date: Wed, 11 Jan 2023 16:52:21 +0100
Message-ID: <CAFsF8vL4CGFzWMb38_XviiEgxoKX0GYup=JiUFXUOmagdk9CRg@mail.gmail.com>
Subject: [Regression] 6.0.16-6.0.18 kernel no longer return EADDRINUSE from bind
To: stable@vger.kernel.org
Cc: regressions@lists.linux.dev, netdev@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi all,

Since updating to 6.0.16 the bind() system call no longer fails with
EADDRINUSE when the address is already in use.
Instead bind() returns 1 in such a case, which is not a valid return
value for this system call.

It works with the 6.0.15 kernel and earlier, 6.1.4 and 6.2-rc3 also
seem to work.

Fedora bugzilla: https://bugzilla.redhat.com/show_bug.cgi?id=2159066

To reproduce you can just run `ncat -l 5000` two times, the second one
should fail. However it just uses a random port instead.

As far as I can tell this problem is caused by
https://lore.kernel.org/stable/20221228144337.512799851@linuxfoundation.org/
which did not backport commit 7a7160edf1bf properly.
The line `int ret = -EADDRINUSE, port = snum, l3mdev;` is missing in
net/ipv4/inet_connection_sock.c.
This is the working 6.1 patch:
https://lore.kernel.org/all/20221228144339.969733443@linuxfoundation.org/

Best regards,
Paul

