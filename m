Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283CD2D9796
	for <regressions@lists.linux.dev>; Thu,  9 Oct 2025 08:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759996980; cv=none; b=XTcNei31sve4iwEqLIqcksk85S+rL1KJxnqKrfmgm+YMw0E9pDUi9X7zYui1HHlKT41Ra7iDk70jhCegQvtUdPsOIUPCG5JHrfA/+t3lA1keVuitte5UAeFHNMv8PjnFBqQCcPpeqSoNtLyhiwiajikWsvnH9GdIjIBp/3b6iQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759996980; c=relaxed/simple;
	bh=K8tOls+YuUMbAJn57FpEQBFXdO/h3ArpWBRwCguKFNQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=to2QZuOyaKxVYRkwnU8hQj3FVDHC3aOu1mrIKSNghQvHmWQBXavn44nRWAAxHsZABNMILWP5MbIhGfHFKBwdaj9oxrYwUYs5AspOSrqVnJYHeJWqVvILCMZ3wAQj7kvwOwtp7lNnrVkqz3YDzQHw4SbxmPaUgPLWCN/gS9oJCF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i1k4V77V; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i1k4V77V"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3ee15b5435bso395923f8f.0
        for <regressions@lists.linux.dev>; Thu, 09 Oct 2025 01:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759996977; x=1760601777; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nmgZ1stJzO0OXNGhzzc20pBZnkzJWTSFXL/OwU1NfN0=;
        b=i1k4V77VY6xKs6hcwwXlz7NSKe4NQ2QCn4wB5pJDoyVDxITr6USYHPcCNhp5beVBsE
         Bu9sP9Z9/FyWoZeVHb6v4F+sVXq4irhu6Yr+3COgW+dLW7YR7JQxyYLOafaxdUnASe84
         MambNmv5A24wa+2i0utVQnpXf6V1875JyhY/0jdRnCfn67t8vRAgJK4fSMIt8s4hL8OS
         1Bl/sQAV18tK7AgHH+WGJOaTlM4Q0JzOnhHonJ15NLQHUQYcP3NMA0SEjKUkzMS76CZd
         9W3vjkxKH+SIsSOYK8PQOeusYmuloTje6JqSsxeLPTjaXd4h0wKxrOw1jKQRhJf4IGrx
         yzeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759996977; x=1760601777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nmgZ1stJzO0OXNGhzzc20pBZnkzJWTSFXL/OwU1NfN0=;
        b=pF3m3Rn5KtiPuHl/5eJRw7K8Twa7EgP6fZJwiksIpfiD/n804ko3mrZeInT2+qO4GC
         RNSzuF5CFmdlfds9YO9bScA2gP6uwmYddhVbEYvJvdEJ8J3MyNwY0Wo8MuNKkVgUzw/k
         MAUL3lzELuMhfWTrmpsmuIMN3vsryE2+QuHpnETl6panJTAdgGja2VXrt3jfBBkIFOiM
         zClIkzlolRR/EieoEqH4cWThcjJkbjRXvlfOsZdn2zx3PdCE0BjFLBvqoGBLEtSA8la5
         /6swVlBn83QovCSFIn4s6qmkUR2GxZHYzwRQGxCMe5Asw4/0QXX0bH6SYXbHGTQTlJme
         6LPg==
X-Forwarded-Encrypted: i=1; AJvYcCVqaHboYgRhHSpXS7Pk7a5CUUII+OzgXhMx3LdQoiQ0dp4gxC+HmIIj0+R5UN9fkiso1j+DzBOqxN+2Mw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwN9Bv3YiZ5smYBxeLEnEGM9ASltteO1T7q0C4XD/0zDlpsRI9+
	bNvklG+fB0CIt9uX6LkU+GRccfXAIaMxfZpjPrqxapODTpudnAgsw+81
X-Gm-Gg: ASbGncuTf0flci2Wm6FBsq53GdXor5r+e1pYDFFBuP1udqZocvq+ID3OUyy5Jq2/2IZ
	Obi7gw7QKsGRiHtu9jcIUCjvUaW05NTaMIgqZT6aK+ITfDJpR7OYUCmU4yzkke0hHd6FcqqMIwK
	67SibgKSCugrQDe1cnDuHuVEo2IqdoTgwD2MkatulMPdz7LEslP8vUSz5tMtXfAgFBEB2cM59tW
	+YyQtuV79jTXr8dzL+4WHkFFAjeu+696ZreBefREIkmF3MYiNt+srYB2JhKzXK7sdqc6rlw7Mtx
	9ldTBFnrOIMalj9+xYxtd/RxziVYBN26rjABwP0MwW3mmuy0Wj/teeJJuij4m5nJ8ynF0JVUNI+
	495AtwdUp4Ihb5A7qi7i1G/J6umrJ9rLJrRaPrlouuZk=
X-Google-Smtp-Source: AGHT+IGzzMQT0+Q4KC5cr5OVvpL7nF2Kx6VgeouWeY1dugB8ebtVbkbcg1MO5oNHGLNrWpLIfhYvqw==
X-Received: by 2002:a05:6000:430b:b0:3f0:4365:1d36 with SMTP id ffacd0b85a97d-42666ac9d80mr4139943f8f.16.1759996977400;
        Thu, 09 Oct 2025 01:02:57 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4255d8e96e0sm33432337f8f.33.2025.10.09.01.02.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 01:02:57 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: linux-kbuild@vger.kernel.org,
	regressions@lists.linux.dev
Cc: dxu@dxuuu.xyz,
	linux-kernel@vger.kernel.org,
	masahiroy@kernel.org,
	miguel.ojeda.sandonis@gmail.com,
	nathan@kernel.org,
	nsc@kernel.org,
	ojeda@kernel.org,
	sam@gentoo.org,
	thomas.weissschuh@linutronix.de
Subject: Re: [REGRESSION][BISECTED] kbuild: CFLAGS=-w no longer works
Date: Thu,  9 Oct 2025 11:02:50 +0300
Message-ID: <20251009080250.1089826-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251009075149.1083040-1-safinaskar@gmail.com>
References: <20251009075149.1083040-1-safinaskar@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The bug still reproducible with current kbuild-next (2ea77fca84f07849aa995271271340d262d0c2e9)

-- 
Askar Safin
