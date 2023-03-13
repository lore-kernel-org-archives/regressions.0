Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF1328FC
	for <regressions@lists.linux.dev>; Mon, 13 Mar 2023 16:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678725275;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=fqsCCadEeLBQPiW77d6JKg08JqzcL/IQAFHTmyw+CH8=;
	b=KUV8zEZ6VcW8vQw4QRh0EpunUURdG8ICOnc9buLD82t5LkgQw3glqs6xa7rU2CjQK4F0Kh
	Z7FWNeNyiNM27DJyh4oi962IotK9AYJwgBMGUUugD9I0Lm6TbG7mM9LxOJfW1hGH/eW1Z2
	vvqK+qUYvxKpGqMJNjyb53W2x+6w6zY=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-104--ahQzJOPP5CfQZMkBeDm8g-1; Mon, 13 Mar 2023 12:34:34 -0400
X-MC-Unique: -ahQzJOPP5CfQZMkBeDm8g-1
Received: by mail-yb1-f199.google.com with SMTP id b20-20020a253414000000b00b305140e33cso9903295yba.0
        for <regressions@lists.linux.dev>; Mon, 13 Mar 2023 09:34:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678725274;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fqsCCadEeLBQPiW77d6JKg08JqzcL/IQAFHTmyw+CH8=;
        b=duZqmGT2sb51QqyEBrDZNKAcS5q51ssCBZdZePVh07wPEgku8WCHN8YCLvERD9lcBs
         MPZ0YFF+iatryThXk0aULTfCkT3YSaNm68qBBU3NxOOaL1Rdse/BSypawCvrMH4HVlfv
         gDbKgDqeWrgDlY4pylof0vDsapOxKYUSM6s3d39sFMMNdHdp+5gnGImiXkVaDfp/d+t6
         veqBluNuv/yYM8m5sDQSq2OYKrKTmEvFFI4+j9SkxbByvbv/TtMO+S0rQebbPSvBUU3Z
         DD32MSSOOGZS/pMcVJAsw7yRL1V+7F4TQyainNJAgXw2DGDeiEgnuHi3KMkZD6+ma+EO
         xyZw==
X-Gm-Message-State: AO0yUKXU9T9SybL2K56h7B3xzEE2sO/xYkYb/7plCtKmQdRoMtx5ywgp
	QA7iWiaOrLj58n0jz5hhCzXiAsY5ZpEXVnPUI+c6l3TszXy9zh0s5AhUjV0PfkZuvhzEwtlMhcO
	WYY8+TVNqF2BtvKqap6v95jeQ6ykSt7DcMEn2DOv3zstiUDJGIA==
X-Received: by 2002:a25:8903:0:b0:b34:54fe:bb2d with SMTP id e3-20020a258903000000b00b3454febb2dmr5505160ybl.8.1678725274065;
        Mon, 13 Mar 2023 09:34:34 -0700 (PDT)
X-Google-Smtp-Source: AK7set9rwEaavTcoTgWbXI0LbFtdbxcqqMu1e6BjZJgz9nC/+SuTmhtRuI2V1USQTycu54eNyZs4apjIbMUh3JeZ3Tc=
X-Received: by 2002:a25:8903:0:b0:b34:54fe:bb2d with SMTP id
 e3-20020a258903000000b00b3454febb2dmr5505152ybl.8.1678725273806; Mon, 13 Mar
 2023 09:34:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Jason Montleon <jmontleo@redhat.com>
Date: Mon, 13 Mar 2023 12:34:23 -0400
Message-ID: <CAJD_bPKQdtaExvVEKxhQ47G-ZXDA=k+gzhMJRHLBe=mysPnuKA@mail.gmail.com>
Subject: [REGRESSION] kbl-r5514-5663-max hdmi no longer working
To: Linux regressions mailing list <regressions@lists.linux.dev>, stable@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

It looks like HDMI audio stopped working in 5.17-rc1. I ran a bisect
which points to 636110411ca726f19ef8e87b0be51bb9a4cdef06. I built
5.17.14 with it reverted and it restored HDMI output, but it doesn't
revert cleanly from 5.18 onward.

From what I can tell it looks like -ENOTSUPP is returned from
snd_soc_dai_set_stream for hdmi1 and hdmi2 now. I'm not sure if that's
expected, but I made the following change and I have working HDMI
audio now. https://gist.github.com/jmontleon/4780154c309f956d97ca9a304a00da3f

Thank you,
Jason Montleon

