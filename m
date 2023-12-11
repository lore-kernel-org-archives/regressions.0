Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E912567
	for <regressions@lists.linux.dev>; Mon, 11 Dec 2023 04:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dHplbfQZ"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-5d4f71f7e9fso38586567b3.0
        for <regressions@lists.linux.dev>; Sun, 10 Dec 2023 20:05:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702267548; x=1702872348; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6c5XEggOqw3xk9aoSU9rt14kv8urnuainESwl7WN7lo=;
        b=dHplbfQZd5q10Xu3fXzkTvief8mtN9WWk2swShGCa+81lUqVEHSJ7DAaxsGTOCBgFm
         kUnXK9PuCAl5gziekxCUUf+E1r9sdS6miguk1MJzjWgWUXu12UhiG6vbr2BGT6hE34ox
         WUatYc6dw/L77FukkzOZ3fbw5bDF5mZfWTIvS5Zab4nEVIQI/gxGZOqNyOym8EGRza6/
         QEP1z6CPNF4hlNQqSH/I7/mGPFjw1m7mmMDtAgpIfSRfOv3l+ZhO2jnQwVo7G+BcLZVc
         qWi44Kpg/gUhyWGGABubyfAPFiCSvMuzErAuAsxpBWGF+lZOBAMVJ4MMAhjs+q0jA3xP
         wqow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702267548; x=1702872348;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6c5XEggOqw3xk9aoSU9rt14kv8urnuainESwl7WN7lo=;
        b=sfOcAXNco67aUnQxQVVCNhlwuO28MoerJgGSO6NTJB7syJlZuWoxnBAyIH+wpxXEVe
         lhdAE9Lpp6nHvvY9EVO/52JbcBW2+XyYPV8cH8FIalw5F0W1+Vf3hmalrlrROZTDFlko
         s1GXaBl8nH5Dn9IC31mHVOwF38wnQ8OYaPwihdFBSexPn2HZvPVxxVSQudv8Wvw+7S1S
         UoFUOwqhjNsL1WL4Lhe+6r+z6LbShYtwRdRDnuhZa4SkCCMURuGJGsjwRwf94jkQeBLR
         WGIOptCJlOQCW4EZBYpbgX/jAp2b1r3Hr3TQaF8qa7iidBKwiOe+F5HNCYPx/a9Y6BUT
         5rfw==
X-Gm-Message-State: AOJu0YzIX5sLaMc511HJzpPfyQW2653PMRnDzEaBAW7pUrJ+ig0zdNgd
	vyopTcWKZs0ojtQ3rk0kP5dmchHSkzsokPNNozg=
X-Google-Smtp-Source: AGHT+IGbMT55xsUUhGQ1HM7u0rXiQOgklpYEX9qZI6z3e+8DmgG6ztCKLvda5CWlBoupdwLHcCEjGep3VTf6L8K/Xww=
X-Received: by 2002:a81:7c45:0:b0:5d9:50cc:b8ed with SMTP id
 x66-20020a817c45000000b005d950ccb8edmr2908389ywc.86.1702267547989; Sun, 10
 Dec 2023 20:05:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Simon Kaegi <simon.kaegi@gmail.com>
Date: Sun, 10 Dec 2023 23:05:37 -0500
Message-ID: <CACW2H-4FpZAizkp+U1aS94V_ODn8NUd1ta27BAz_zh0wo63_rQ@mail.gmail.com>
Subject: [REGRESSION] vsocket timeout with kata containers agent 3.2.0 and
 kernel 6.1.63
To: stable@vger.kernel.org
Cc: regressions@lists.linux.dev, Bobby Eshleman <bobby.eshleman@bytedance.com>, 
	Stefano Garzarella <sgarzare@redhat.com>, "David S. Miller" <davem@davemloft.net>, 
	Sasha Levin <sashal@kernel.org>, jpiotrowski@linux.microsoft.com
Content-Type: text/plain; charset="UTF-8"

#regzbot introduced v6.1.62..v6.1.63
#regzbot introduced: baddcc2c71572968cdaeee1c4ab3dc0ad90fa765

We hit this regression when updating our guest vm kernel from 6.1.62 to
6.1.63 -- bisecting, this problem was introduced
in baddcc2c71572968cdaeee1c4ab3dc0ad90fa765 -- virtio/vsock: replace
virtio_vsock_pkt with sk_buff --
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=v6.1.63&id=baddcc2c71572968cdaeee1c4ab3dc0ad90fa765

We're getting a timeout when trying to connect to the vsocket in the
guest VM when launching a kata containers 3.2.0 agent. We haven't done
much more to understand the problem at this point.

We can reproduce 100% of the time but don't currently have a simple
reproducer as the problem was found in our build service which uses
kata-containers (with cloud-hypervisor).

We have not checked the mainline as we currently are tied to 6.1.x.

-Simon
