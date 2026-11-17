Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.169.15
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794939387;
	b=Y94+hRNlgSN1SI73kkNsu71NeK70XYHt62EjQphGBafdQ0RwOWk5V48m7yz3GXRdmZO1
	 7a2DOmft4ZKfYS3LxTa5Cz+z8+PcD4fpsORLGaF/8z1+N924jv7hgQYE2nJSJ06Ed/2Ao
	 PZ7ZIhYL/OZ9SskYPXo6EEDgQJ/1mxYSbt4P8OLqjSZP9e5pw7zLhFhKemSqIczYYInV3
	 3Ge2oeBHy2EM8pMhFlj82xul98jABTWIf87LrohU10p/fM1Z6HvlN9K/bfaayggkf5hGl
	 P0bJv9rzqw+WeknqUt7xnEyfU9FvU6rIRMmM3xfxva2DYrHc/LcHmgwhlQAW5DBskGA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794939387;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=WHIQxeoR6vINETekLiTI/f5ywXyoHU09pB3XVrXEfXE=;
	b=Jzf4uvl3zCO4S3n1jdYQj/i7AvC5lYS7UiotYcBP4HMgG0mY+jCVHhdzCbG2jTJMCSL5
	 i2kx2PRJOb8S5VdqZPEVjWdDXH23+4TrwKmz7YVeBcoQQ0sVciBCwCsO0qJBnHn7yv/eL
	 sCzw8ALfyZ+TQbS5n6CTJxkWjBqIon79QQrEAEkqnQ8jwIWl/WJkxOSnrOpAnIq5UlgLA
	 D3yKi9mIoyXV68IdQqz0o02squnX4LeahktTMA8tHotRY8NwVRCsHXJOjP4XBwMUfZ5pr
	 b/U8rA7SR9rHIoPuBS8CjRxxG5JeYTYpeEsk/iw4XScluF/sQnJzlGHfmkk935/oZnQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=iav.lv;
	spf=pass smtp.mailfrom=iav.lv;
	dkim=pass header.d=iav.lv header.i=@iav.lv header.a=rsa-sha256 header.s=zoho header.b=ZllJTcWm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.169.15
Received: from sender-op-o15.zoho.eu (sender-op-o15.zoho.eu [136.143.169.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59282606A334
	for <regressions@lists.linux.dev>; Tue, 17 Nov 2026 18:16:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59282606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iav.lv
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iav.lv
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=iav.lv header.i=@iav.lv header.a=rsa-sha256 header.s=zoho header.b=ZllJTcWm
ARC-Seal: i=1; a=rsa-sha256; t=1794939373; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=jPM86I5fXXkHprkvLBi4twb7QXQFfGNSR471U4Xj2AmO33WwucwF4X/RByhfEVf/qStA55x0RUW+OLfQHVLvSLHp/cGG38CJxWp8GDdwPWTa7xrK9EGlg3N448KFGzVcMM+HvIBOmy/sKLpOfhpdHTF9ZCHSaeAu0wzy46Onpiw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1794939373; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=WHIQxeoR6vINETekLiTI/f5ywXyoHU09pB3XVrXEfXE=; 
	b=c0PUZxL6+rrPi5a894TpamTZZdLM9HmSRhUkHs/m/153b9lQT/XXZgwWeQpmCs8boR1MSN8RlUSNw8wnhkFGinH9MmtxzDxayDDSwqtJ49pO1e/IcAgdKfdUgESEuIXj1xtJhi9kXMsirBr6K75g+PXjTbD04KycgRz3UmS++1I=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iav.lv;
	spf=pass  smtp.mailfrom=iav@iav.lv;
	dmarc=pass header.from=<iav@iav.lv>
DKIM-Signature: a=rsa-sha256; b=ZllJTcWmygp+HGw1t9C5Z3dZMdLLoAUl+GmOz6SupgIpuMNnG+fiqVVkUkHp+W0yv7C46SBl/YZy3rcIcplXT07wDPPAcVL0FyCMESvt4CFt+q6QxfKHwswFWUjvmoIDVb7ALKrCqk/lRkdOB8BlvPX4iSwusI1uh4IKABJcexA=; c=relaxed/relaxed; s=zoho; d=iav.lv; v=1; bh=WHIQxeoR6vINETekLiTI/f5ywXyoHU09pB3XVrXEfXE=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zoho.eu with SMTPS id 1794939371281278.3710763207241;
	Tue, 17 Nov 2026 19:16:11 +0100 (CET)
From: Igor Velkov <iav@iav.lv>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
 Shawn Guo <shengchao.guo@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 linux-gpio@vger.kernel.org,
 linux-amlogic@lists.infradead.org,
 regressions@lists.linux.dev
Subject: Re: [REGRESSION] gpio: shared-proxy: open-drain regulators on ODROID-HC4 fail with -EPERM
Message-ID: <20261117-hc4-gpio-shared-od-2@iav.lv>
In-Reply-To: <kcopbszdsz2amzas3hmchxokw4bjxafu2wzjplthyihkellwd2@hd2k3tomwvdq>
References: <20261115-hc4-gpio-shared-od-1@iav.lv>
 <kcopbszdsz2amzas3hmchxokw4bjxafu2wzjplthyihkellwd2@hd2k3tomwvdq>
Date: Tue, 17 Nov 2026 20:15:00 +0200
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On Tue, Nov 17, 2026 at 02:35:03PM +0100, Bartosz Golaszewski wrote:
> I think the issue is with the proxy driver not
> propagating the -ENOTSUPP error code in set_config().
[...]
> Could you try the following diff?

Thanks, that fixes it. With the diff on v7.4-rc3, 4 of 4 cold boots:
no -EPERM, vcc_5v and both p12v regulators probe as open-drain
outputs, and both SATA disks come up. Stock rc3 on the same board
failed both p12v regulators on the boot before.

Tested-by: Igor Velkov <iav@iav.lv>
