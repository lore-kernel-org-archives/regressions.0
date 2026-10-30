Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793365673;
	b=DugpRGraqPfyGTSs3DGMpJkHnnz2WR81ZtIwFCfBvvqvPGtcSzNM9clg2s5v4ypgUpew
	 jCd+NCPG4SV2DVQ/wK3qblvAIrWY+aDT0G0yBCN9/+rlD+U4nH3OKY8tJI27iaU2r/V3V
	 gQWu2xhDQFy2oqF6Fc87UwroKag19qBWJejsNVOBglSk97d5hcbVWKEbrLHGqI/+0QTcF
	 W6N8jsLVfPHp/Z3glpW8zk4Ykh3eMAp9mzR7jultJyYyKtpmf8YsJ2YPiDtS/iywAMTsL
	 TFL3sdkpxwRdMBdoh6BJ+rMx5RRwUye2KHczKKaqwSzuF7Q5vSAA1h/raEBnKorljqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793365673;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VBqZNaxtB8zlZSrHdHu8zRInBozrHHy4u4axvoQIeWo=;
	b=ApYgZwHWu0n0GypYRHGmOyHnmue1aTLjC+XkSVUGF2vU09mXw+K7zApVSvJgadfDbEmE
	 jdjJkKOSB+H5OV6y1Iiro0iwlL7Kwguij9qadJaoiIOPEhTrttJasghVJOFyn8KjMmOxi
	 VHUBIFEfjNYgcqXTmRA7usXOQ3hoVONnODu7q6lKAwpmATM469s8nZqVEOe3yWanL3HYN
	 3tmaBOXYfVJhQpC23rw2GUc59d7L9aI0NF+hYC7Mtk7K4zmHtxNdjiziQ7F3rF67jhpeC
	 7NoFrEZXy6GgwanmfQJPyEXtX8m0mES6cACvwNumqx2TMmHbFApwadxM34iyCkFRV9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08FAF60A2600
	for <regressions@lists.linux.dev>; Fri, 30 Oct 2026 13:07:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08FAF60A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3ac77270fbfso308070a91.2
        for <regressions@lists.linux.dev>; Fri, 30 Oct 2026 06:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1793365667; x=1793970467; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VBqZNaxtB8zlZSrHdHu8zRInBozrHHy4u4axvoQIeWo=;
        b=cNPDKo1LVTjeTK/3dK8wZenSH8Kxwqz65fr0iux4QdvsiVOnpBC7DI3Xm99MilPm/Z
         d5RshuY4mTjkKPKoQf5haYwhwMqE8tT7DPrhQ7d2So37Jm3bSDg9CHx/n2j0zAYNVxdH
         +QZ8djQt/QWXo7if4FDmQgteytVCFHQZgJdGV5GnzEWyziaBvG8Ns0bhX6nTVTnVRrpq
         p8AQBEABP3H3EuM5b4V1/ja5/mJNmRZ1+iYY7DBPfdX/AOytrqp021CG/TslVu4vNlle
         nKJ7G0v7F6COrbD+S13w+MwitgMZojE8OzBVpZDhQq98pzUv3tEDZdRfPdBesDd8HRCo
         iB2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793365667; x=1793970467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VBqZNaxtB8zlZSrHdHu8zRInBozrHHy4u4axvoQIeWo=;
        b=aRaG97So9k34sMlGAuu6OpPPfhx2qdgYFP7341omn315x5SfhlcOPVSRu4epLzgz1M
         NjLJ/wrVn8py1UFQ9AeVbtZ21S4AP8aKwBQOaf2NoVA3Oa7dB8XZUksVJUQgjg6/7+7m
         PplCMKUmjkLKyZyx15nEHRd1qJJ/vmr/+NwdSf6C3a8Si57MJVB54yW0Y+sPuNjdCZ5d
         19zxVtDYovbxIKsw2arI6MljzQoIqaL4IwmK0RiCo2+ZYlC3akJKrFUMJBvaMqSooNGK
         bJr06XSsULSAD+b6t6Iy0mVEs6GTPi9GZjOq6MEBIQil19OD7wNrZBQ1PS5P1JtpOLsA
         iPKw==
X-Forwarded-Encrypted: i=1; AKwUvBwCpJ+Gv9F1PZ+ppqHA/Qnq/SWYOlEVXZyWKhLEt6/6VI3Ef4O7z9eEiAGNNG2SPNm0FXxl7WaK2MYVaA==@lists.linux.dev
X-Gm-Message-State: AFq9FYJS1z1WYR6dGsdFBemQMKTGIgO6AEVODEA5xojSUUUtTeltGTnO
	Yyh0xkFIi0DpH5r40l6HRCkoHlTqMZpZA/leb0aa9+gfr651oXIqkhRTd0gRLP0Smg==
X-Gm-Gg: AYBFou3vUZWatJxWDHrH66WNOQ5Yf+DxA+bMAIrGYWMVSSQdUpkODxX+uq1vaZfIikL
	fX9PpqXpekB7xT2dZarDF1WLpOVcF/feX4ucCjx6UJsgPdH5vg3LH9gSiCRMRx6OdEjv36sc773
	byzE+OiRmizf15T9BuwP34rwY/i6j0/+8+xD2OQJ3f+xqy4oYn7eJEYxo+jeQ28H4ea2C7xUC+8
	FW1unq21++z50U98IneJ/HfwfNqfAuIeCdKDXLxmnMCtRxZnrz+wiWf+DjJ8kLKAJ+tIXSjg2wp
	V7oHTueEHbwKJtwIRTQsCNsB32r2SHYF5xqC5ijkvK8EoPeJjNTAZYvdnUuvsRSHmA2i+sYUdAM
	AWzQ0YFQ4vgKvbkjx6QQA0mqoZz+B+zh+kRCyL82QKlMTEokz7hZ0/y8A+Rbzl+uVj7fJHMKPxr
	SDL6eU4nVOROAftF4/xKiu80UroNm8m3zSRJ9hWyn3uN2hhfGNJQ+Oo0M4arMN5UF2rkIlKcVCz
	xmDesfi20EGwseVoywQ6qhmAdQbNzdSDb89j+sV7VoBu0m3OdUfqF/IwbZejAbkYL4fp8m2UcP1
	2iqJJb65MVD+SIasfdqsZvpa4eYw6a5QCN55RGO19OAKRVoamkecJhjjKYi1abzNiKCmvLUX/Iz
	CFeeQLrPGAut7Spia
X-Received: by 2002:a17:90b:5243:b0:3ad:3e8:12 with SMTP id 98e67ed59e1d1-3ae89806353mr1634562a91.48.1793365667017;
        Fri, 30 Oct 2026 06:07:47 -0700 (PDT)
Received: from cantal.lan ([58.136.77.93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e2a703esm8733413a91.0.2026.10.30.06.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 06:07:46 -0700 (PDT)
From: James Clark <jjc@jclark.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Matthias Kaehlcke <mka@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Ravi Chandra Sadineni <ravisadineni@chromium.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	linux-gpio@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH] usb: misc: onboard_usb_dev: don't defer the USB device probe
Date: Fri, 30 Oct 2026 20:07:42 +0700
Message-ID: <20261030130742.3211592-1-jjc@jclark.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <10ad94b3-66db-49b5-95c6-3ce9090f3278@app.fastmail.com>
References: <20261030114705.3159093-1-jjc@jclark.com> <10ad94b3-66db-49b5-95c6-3ce9090f3278@app.fastmail.com>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 30 Oct 2026 13:24:49 +0100, Arnd Bergmann wrote:
> It sounds like the underlying problem should be fixed elsewhere,
> possibly by preventing the deferred probe to be retried each time.

Hi Arnd,

Thanks for the feedback. It looks to me like it is probably possible to
fix this better in the USB core. I will attempt a v2 fix that does this.

James
