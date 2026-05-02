Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8511B3925
	for <regressions@lists.linux.dev>; Sat,  2 May 2026 09:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777713773; cv=none; b=l4X02NeZ0MO3Q+iKRwfxdCp9ji/5J47XsbaGbV5PgAGIE8ptDSOUSN1vlddYTr2jik+lAoFKovIxewaTS6L85g+zF9mDPdj+2rOAN7IHLbpzBUHJCbZU8f2RDPgquqmhW7Uq00SuTYF8TfYu2XzD5xg/NvvkWDy5YA9eJKxouMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777713773; c=relaxed/simple;
	bh=5D3TxgIyE00DYrWiTKhypjt+XeZdEVjGxqgjrwqORLI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j7cSM0VJ6xehRgePGA3I5Cq3LkAr5kXRKVT9x64Ika4FEguJJ585EQRoLKM6RpmgpR42tbX+2/rpAS/qI0cuTciQ8znyIdwzk9CeNMTRGsMxPq3Na8C+uIlrt7A+7RTGBm4TF+J9T7ce1XohjlNfzb911EYJkWSEUS3/i55FYho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SrQ1A94c; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SrQ1A94c"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488ba840146so20843645e9.1
        for <regressions@lists.linux.dev>; Sat, 02 May 2026 02:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777713771; x=1778318571; darn=lists.linux.dev;
        h=content-disposition:mime-version:mail-followup-to:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5D3TxgIyE00DYrWiTKhypjt+XeZdEVjGxqgjrwqORLI=;
        b=SrQ1A94cjl0wgP+S8gPnNi72dbP64tJC0E2dx/b52nbEwhukv7bqjOxTb+eHqMbNXY
         Cjfbb2hNTbkM/Olpvz/f1CKnKPY9TYdhAQ0Q4Yz0D3Q/32BQqTUreYWUgumKc6J46qaA
         VXodcuFO6H88irHLHyuF8JYdFPSqO3cF+2gE4jpPdDrWClaOr0Ro22cyF7JcSUh5tQES
         NEYcGWZUDRxl9+Sh2J7mwpOUWhfR4GnfAtA6j7cLoLJx2QJqZyy7gX7U7zweA2BUXm2D
         Y61XZFVFLdRiWaRTmbUq4LFAu/ruH0D9JXv7ofT9EuuAgDT04DD1PqTFxEsOO8R1k26J
         Bxrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777713771; x=1778318571;
        h=content-disposition:mime-version:mail-followup-to:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5D3TxgIyE00DYrWiTKhypjt+XeZdEVjGxqgjrwqORLI=;
        b=TYEf9JBkEGLBLdpHeTICClHqjGpW7fTkk4IWU8sVCQ3RElscziLVeSPdSC7pWi/Rpy
         yfr/8DZTxUG00qmQ5hr+/outqn8PGSfRliHUx0KH3/zoBW8w7sPmPOfOrBY/JfWZXRGn
         c0aJpFHswBVgHA2261rOAMuKlrud20mNjNgf81cuVDls1tLnjswCvoJW7WdR+IxVetZ7
         ylDgKuwQ4cxXBxsNcvmJd69RiyfI14vH99NRFjyRlcAomFeAtO047hXUcMun249dWDYF
         SGumMUkN/ZoA/3BuBzTFvhuPU7hFbuL429+nCEfa0Fi498GWitoG0KUIYXg3PrWgnUHo
         NGyw==
X-Gm-Message-State: AOJu0YwmwQNomL0gy7HAfgK6H5UIhNS576hqnezL3CIPcpKCUFDnboWO
	LYGmOStk+DSG/SOxAddw2LD703oXwLBokb2+kP+n5PWb/Ftr4JWAvgWF
X-Gm-Gg: AeBDietehIKSOK6AgL61dCnBZsO72rM2c+zUMOPRlCvF347kwXbv9RwxsRGlYvZKUIv
	pijyuVA36Z6bxr18f+0GqWJC6sgMW5Coy8g99lE7aOnLUeP+YHZa9V7VFUBQPJdOmd0oDKbkqPX
	4ZGWFAuhPIjfa5ALoEZrcYjKr+e+D/rnQDreY+fG3gl1sB+EUIJEg7mMXW3Aj2bUrxF+r045YET
	ce9HZIyEY55fNYNli0gBwiXeR+qKhUiXUb+cLh/w3LNiQgG//TZeN0rDxA5dMVuUbMAdI7n9c6Y
	CSfuULKa2VBRmSqThEDh47xUym4j3jrgsXZxbEzFveVw78ZNLCoJOxa+37Pp3/r6sAaVOzhvukR
	d2LKLORcRq93TSpSahbxswAL29l5XvRgylnoWKrXhEoYiS9kJswQgPKvhkrqBqYzH9ORIIOtWyU
	xa92RRyXVngFMVP0cJLqpB6aSgNMkTgfeZozJXSKgrq7fVIXqgPy/C9MamvJvqYdwUvjeCgA==
X-Received: by 2002:a05:600c:3f06:b0:485:3abe:ab86 with SMTP id 5b1f17b1804b1-48a9852cc0bmr36278225e9.4.1777713770454;
        Sat, 02 May 2026 02:22:50 -0700 (PDT)
Received: from eldamar.lan (c-82-192-247-196.customer.ggaweb.ch. [82.192.247.196])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a986aa70dsm11010046f8f.25.2026.05.02.02.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 02:22:49 -0700 (PDT)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Received: by eldamar.lan (Postfix, from userid 1000)
	id C3801BE2EE7; Sat, 02 May 2026 11:22:48 +0200 (CEST)
Date: Sat, 2 May 2026 11:22:48 +0200
From: Salvatore Bonaccorso <carnil@debian.org>
To: Jiayuan Chen <jiayuan.chen@shopee.com>, Paolo Abeni <pabeni@redhat.com>,
	Sasha Levin <sashal@kernel.org>
Cc: regressions@lists.linux.dev, stable@vger.kernel.org,
	1135514@bugs.debian.org, podorski <podorski@gmail.com>,
	Brad Barnett <debian-bugs5@l8r.net>,
	"David S. Miller" <davem@davemloft.net>,
	David Ahern <dsahern@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>
Subject: [6.1.y regresssion] 9a95ec9144ee ("xfrm: fix ip_rt_bug race in
 icmp_route_lookup reverse path") causes log spam on ping to unreachable host
Message-ID: <177771348699.1898023.16904466444228860838@eldamar.lan>
Mail-Followup-To: Jiayuan Chen <jiayuan.chen@shopee.com>,
	Paolo Abeni <pabeni@redhat.com>, Sasha Levin <sashal@kernel.org>,
	regressions@lists.linux.dev, stable@vger.kernel.org,
	1135514@bugs.debian.org, podorski <podorski@gmail.com>,
	Brad Barnett <debian-bugs5@l8r.net>,
	"David S. Miller" <davem@davemloft.net>,
	David Ahern <dsahern@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Control: forwarded -1 https://lore.kernel.org/regressions/177771348699.1898023.16904466444228860838@eldamar.lan

Hi

[sending correctly including the needed mailinglists]

This is a 6.1.y specific regression, so I'm not CC'ing netdev, but
maintainers, hope this is fine. After a backport of 81b84de32bb2
("xfrm: fix ip_rt_bug race in icmp_route_lookup reverse path") was
applied in the 6.1.y stable series as
9a95ec9144eeff1fc6fbcc21b677e322c6f1430b, user are reporting that on
pings to unreachable host the log is spammed with the "detected local
route for %pI4 during ICMP sending, src %pI4\n" messages.

One report is at: https://bugs.debian.org/1135514

This does not happens with other stable series versions (6.12.y
tested explicitly, 6.6.y I have not avaiable to test).

Is there a missing requisite in 6.1.y?

#regzbot introduced: 9a95ec9144eeff1fc6fbcc21b677e322c6f1430b
#regzbot link: https://bugs.debian.org/1135514

Regards,
Salvatore
