Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7BE535E1CE
	for <regressions@lists.linux.dev>; Tue, 25 Aug 2026 07:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787641566; cv=none; b=cQjeB62grp/P5zn9Lqt2+N1SpQB9c4UncoI/YNx3sCQoBVqwUqnE83PCxED80hU7dHSqs91ZwKrYdhC2OtjkW5FdQ2ycvrS7yXYmN5VatBNsANIyxdVTJNzRnxmRtVyadHib1+kohbaoJMlcZ9VXR8u5Lj+krxPYKkV/G6ES6W4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787641566; c=relaxed/simple;
	bh=N2ju37nvOA57E81asAY1dq8AEH+5UMeli1v/PZAnpEY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=shzDaCVSCyofs+MZw1ugL9JQAew4vkYLcQgHXcQF0zELb0CNp2hXyjD2D5jzRHoONniHZHvCncJH936VB0iivKe+WZLAc2I1VFNxc1AEXbUzAK4DENpzaJJgCQLSXOcRnvWmO/4i5x0/ZA6JXRM3dAIaC2++7c80SM7fr6hlRag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XYY3rOLY; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XYY3rOLY"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6a17211b9ecso10666534a12.2
        for <regressions@lists.linux.dev>; Tue, 25 Aug 2026 00:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787641563; x=1788246363; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PGat6d7NI0sFxkt98o/AYnXtRvGzfj8FLrXZFFK1ZZk=;
        b=XYY3rOLYauR0zt7VuF9bEHLRYD8WpThpNWrOod1/VP00P/LAh5FU30WX5QDKS8fwIx
         NiWtHRUf3WAcBv5e5zQVG5JQA4ROf9uCeZOyNBTryX+P+5/ktTllJ6PI3NJz33GiIS6c
         mObTjinr60VD0a3bj8xc25tIPcL6zSstSUVE2Aa89MJVYt2hMfF9AfyBk7nuFo5T3S6F
         xiBNpZOx8bFVMhJTFgPPzt1/FcnXgvmKd+daSMOzYFgJ8tNI46xZcalcpKnMFMw4aPAG
         pYt+254zTrZlzFnBj34cIuzSCht5KjB5i7KHZeZzk7vIj80dzvxBfnyBAJLnQKTqTyNj
         Ypvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787641563; x=1788246363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PGat6d7NI0sFxkt98o/AYnXtRvGzfj8FLrXZFFK1ZZk=;
        b=dd2xNqrialB7xtCrhbYID0egC0yaa8g7Wu3gJ+kRnKcCX6b2MqpTSK3j6C7Qw9v1si
         4GR81/O/frNXxnjqOHalXcYZ2TnWo3KzgfJzJMXrwO1PF3LI2oGC8EWvuCWfSS9lR8bm
         CO5tbEvizRJ+ANP07MjDeo2ChCBMre2UJqIovp28ecKTpD9pjEcZp7oxMhMMvsYRkkQ4
         7Fy6VCBGsua6lQjti4w0kBiiacg2zAYHJ6bXVAgVi0UKw/Ey+GjHNUICJcj4C3YhBhlE
         e5WCN3TFbJD+hegzguA9cwYPwPun1b7IbayIxz0AW5rDT7pqbaZBJS2jJ2rYJZ0Lb0sn
         FleA==
X-Forwarded-Encrypted: i=1; AHgh+RqSsZzocUWJMUDnMwyTgdeETguHBoyXYeo7OuWqqL4/cX32v2WE4ECnd5loPPvuxUStdOjYH8alkoCeKA==@lists.linux.dev
X-Gm-Message-State: AFuF++k3bp6yUH4S/YHQd9DMex1kMsRu8kz5nVuAoy8JtElUz0f5bgxo
	Oe+gjqYlCzcV6pqFbDkh6NgNv+qWovnZcY03lEqXr9mJznGxDc/M6Ktj
X-Gm-Gg: AR+sD10Wb7I1cy4PiP16F56R+x678G/8JAlGQbsrLcLiIk6I1v7HTKyRUlpNoozfFxL
	7L6J8ZfWvcZTp78m35VKiGfglBCPNVo6I2fLvv3Sr5WfdFb4zQPKxPxM2MjipW+K9l0Pps/L5pW
	R0X+8sU2TfVzZ7sz0bTvPRihdWHK/sbKD8So2I4VIVC98vRyl2SI7Musr3sasze+TDDHgRk78v5
	MfNKHkJkSOR8B3qiuEkMk5g5drbyeeIthz80ZRhWcZSdrE+SqZ0DkUeSL+PC+gt7isXuddBltdG
	zlk37O6PtZAVi9jQJVf+7iYejkvtmP5/jrX2lFmF0hk5Sct7B3lNOdeeb742W1ZLen0K57olUQ8
	oF9AU0D+m8TGOY00MQEBMYNIh+qowe70jpEoxwUzMyUKDjjpBcX+wSdo9aw6qkS9gn5/EfwBvp9
	EaBkPJNy0akZWmmKUdyaWvFj96swVVRhUoz0oKJk+EpwZ84YKNhEPccyYIy6N8g7OFu00JD3eyA
	g+Kpc+Du6BUoXkH45W97kkLJ3UWPetlQV3lXkquJOjzROTtMktwAeVGkMBTns7YEGz6F4jhX8/p
	HM6WSXTr4ZP2alEpLbA=
X-Received: by 2002:a05:6402:3888:b0:6a0:927e:39e2 with SMTP id 4fb4d7f45d1cf-6a42f1b7471mr38702922a12.5.1787641562945;
        Tue, 25 Aug 2026 00:06:02 -0700 (PDT)
Received: from corecachy.localdomain (p200300eca748c8fc021d81db54571dff.dip0.t-ipconnect.de. [2003:ec:a748:c8fc:21d:81db:5457:1dff])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e1cdbe9sm12235854a12.24.2026.08.25.00.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 00:06:02 -0700 (PDT)
From: Andreas Wild <andiwild@gmail.com>
To: Thorsten Leemhuis <linux@leemhuis.info>,
	Aoxtj <aoxiangtianji@axtjblog.cc>
Cc: linux-pci@vger.kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	linux-kernel@vger.kernel.org,
	Linux kernel regressions list <regressions@lists.linux.dev>
Subject: Re: [PATCH v3] PCI: Skip Target Speed quirk on clamped ports with no link
Date: Tue, 25 Aug 2026 09:05:22 +0200
Message-ID: <20260825070527.8481-1-andiwild@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <7742d556-e878-4893-8b6d-d6039ddba544@leemhuis.info>
References: <20260801201244.4421-1-andiwild@gmail.com> <331e97c7-e422-420d-9f3e-5d9f734464b3@axtjblog.cc> <20260808063103.10940-1-andiwild@gmail.com> <ae819bec-9c2b-47b5-be5e-3c65fea12da1@axtjblog.cc> <20260811064233.11315-1-andiwild@gmail.com> <7742d556-e878-4893-8b6d-d6039ddba544@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 24 Aug 2026, Thorsten Leemhuis wrote:

> Side note: what's the status of all this? From the outside things looks
> stalled, but maybe there was progress and I just missed it.

Nothing has moved, so you have not missed anything.

> Are we waiting for a reply from Aoxtj before moving on with the fix at
> the start of the thread? And whatever the answer is: would it make sense
> to move on with that independently to get the other regression (boot
> time delay) resolved?

Not on my side.  Aoxtj tested v3 early on and it does not help them, which
is expected: their link is up at 2.5GT/s and v3 only skips ports with no
link at all.  The two are separate failure modes needing separate fixes,
so I see no reason to hold v3 back.

Best regards,
Andreas
