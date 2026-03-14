Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF14623BF9B
	for <regressions@lists.linux.dev>; Sat, 14 Mar 2026 14:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773497025; cv=none; b=KOfVp+JkHXzIHXgbmz7DQPFMEw0jNwqkOL8FOjQJCoK/O1thALF5+PTCwF2MKkgqk7Ya1t5MNhx6hO+7ppGwIsD7c52bPeS0whXkq/F6cJ0bZdDdKilFBTOpVQsVNLFvtWJmoAof0584MhF9yIkqN8+sw3xBhorCwI10gj+Mjz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773497025; c=relaxed/simple;
	bh=sgPSEBXiJzbLUZfpo/yiL7lSsuvwcrEZVoSXxcN8Trg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RlcdeAek5Ay1ndD2XVkRrXzChP64gFqzx7cDO/tgIk5nhgg/l/bJmIqxmnUaADAobGfi9C67bbp4AHUxN/Gtaj9i8N0XPODqoTlC5Jg9EmAo+EwAzzZZllBA94ynlm1To53dqU4NThDA6YSYrMPMV1iZ62ur8sU5hmPN30ug+K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KkVJ9ZKZ; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KkVJ9ZKZ"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-899a5db525cso35979506d6.3
        for <regressions@lists.linux.dev>; Sat, 14 Mar 2026 07:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773497023; x=1774101823; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ozggT4VxXxi8nNocpv6bPtGBFv9+GusqHxKISYZjKwg=;
        b=KkVJ9ZKZRME9Y99yZou3vHqACDsMSDX54sA/B+v1ZdQhDGVVkACrWBitjBIDSVICbx
         4Do55vpc27qZjes23ecSrPie5BPEPY/0kL4hfORo1KldVIOvFimRv87315l0uxQRs9D2
         688hVf98EZbxpE5OAgoeGKF1ZXjYcvCf59nYpHmLCACghOQMfw/LwV50VlcQYBVSMIxJ
         MgNM/DAP0IBRu/z5ATU5heuUiStOlyU6aPrfIgQSA7DStEmgMwaOS9gECtIG5trnfdck
         7hteiPm59eqiFx1JLxKnQYopf/aZR+iVj25WmCcyDGBpKv+EGcNrnjOUX79TixztVXjd
         n2hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773497023; x=1774101823;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ozggT4VxXxi8nNocpv6bPtGBFv9+GusqHxKISYZjKwg=;
        b=dtSPZY+UjrKw2t3mEX7aRIwtTV48g3I9MnVL5EOzaUHrEd5inD53abQvC86EH2xhuc
         cBjYD02LgS5hVHSxXP0vb7erR8Qpytr2O8CHTbYcbaERV1itUDlwwZZ/SW4wms/GHeWp
         cQ9NdGqjlvlxnXsYgPq85UIcF7DJ7yct48lh42Abl2qUM/47Ce/klUFhUjRbznhr7XD2
         eqJJycJfgQR1unMJRbpLMv/5OJWtM0FLPCa3bdHMxPljPtw73q3dddc3KzkJNlGLNp8+
         RdJlcxcJ/KPFUv8ZrZ44mcWv4v1fiHtwcuA90N/ALs65gVwUr+sT4jhRi3rzi2GVadw1
         lDcw==
X-Forwarded-Encrypted: i=1; AJvYcCURWJPbeUy6E7yBMO8LQmHsEjCF+BtZbp1ce1p/F17Q5LIbAWfI9mPRoAsyxCycls8MZaeS1PCcC44CHw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxY+GZ58+ldvenBQhG6RwvoVvnGlZn53uWgTY/pqcASr0LhNpas
	UdoJ1rOpLQBh9+Ud+9gzxeX+eyhncLr+X9V0z7M9WVnHgdqDBMubRPvZ
X-Gm-Gg: ATEYQzwQRCOfIdSgPXQ5uqaa1mxp+jw/hD5/VK3SSXfu+tmfs6cH3AWlBsd9Sl5WMtA
	hhwUct3++qbMNRo6MwYiShWJkWCtkfajZD28EefxASBzOEt/tzyB83fhyZPmnoWh44tMEdL1Vmx
	vnm/7Zxwdn0axTpBBjePsmQYs1R8jw7JtdNO9LSFow7ZJtVrMPD9jJ3di0qHpJA3uN/cwSveZVi
	zLzAxPAHZnRdSiuyc8MlFSWdpVpgST1LQJcFxAaVv+htcGUPIhNtKaM9QRMoUkCgFmY3fedihMQ
	PdSXh29xsSJHdNckcfwrZiomEcv1az2MstA6vtz4C3+U7qHmDyrPQHyoCJPO/ppjnOXcgCckJOX
	mzd8NatNEEbeanP7C/5e1EtUzgn8ZPIRmrrBMlloRFNKkbhDXrA4uJFn8PSxpRZfztXj2tTNhD/
	keG5PrivbE/KAvEsUAsEX6F9GJLsbM7TNFmk3QM5QWYcUPfJIrm1uqnOWwYElwklIgOzVdPA==
X-Received: by 2002:a05:6214:5907:b0:89c:44f9:e879 with SMTP id 6a1803df08f44-89c44f9e989mr4328376d6.49.1773497022499;
        Sat, 14 Mar 2026 07:03:42 -0700 (PDT)
Received: from eldamar.lan (c-82-192-247-196.customer.ggaweb.ch. [82.192.247.196])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a65cfc85dsm78266516d6.37.2026.03.14.07.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 07:03:41 -0700 (PDT)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Received: by eldamar.lan (Postfix, from userid 1000)
	id F187DBE2EE7; Sat, 14 Mar 2026 15:03:38 +0100 (CET)
Date: Sat, 14 Mar 2026 15:03:38 +0100
From: Salvatore Bonaccorso <carnil@debian.org>
To: Fernando Fernandez Mancera <fmancera@suse.de>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>, Phil Sutter <phil@nwl.cc>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Alejandro Olivan Alvarez <alejandro.olivan.alvarez@gmail.com>
Cc: 1130336@bugs.debian.org, netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
	stable@vger.kernel.org
Subject: [regression] Network failure beyond first connection after
 69894e5b4c5e ("netfilter: nft_connlimit: update the count if add was
 skipped")
Message-ID: <177349610461.3071718.4083978280323144323@eldamar.lan>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Control: forwarded -1 https://lore.kernel.org/regressions/177349610461.3071718.4083978280323144323@eldamar.lan
Control: tags -1 + upstream

Hi

In Debian, in https://bugs.debian.org/1130336, Alejandro reported that
after updates including 69894e5b4c5e ("netfilter: nft_connlimit:
update the count if add was skipped"), when the following rule is set

	iptables -A INPUT -p tcp -m connlimit --connlimit-above 111 -j REJECT --reject-with tcp-reset

connections get stuck accordingly, it can be easily reproduced by:

# iptables -A INPUT -p tcp -m connlimit --connlimit-above 111 -j REJECT --reject-with tcp-reset
# nft list ruleset
# Warning: table ip filter is managed by iptables-nft, do not touch!
table ip filter {
        chain INPUT {
                type filter hook input priority filter; policy accept;
                ip protocol tcp xt match "connlimit" counter packets 0 bytes 0 reject with tcp reset
        }
}
# wget -O /dev/null https://git.kernel.org/torvalds/t/linux-7.0-rc3.tar.gz
--2026-03-14 14:53:51--  https://git.kernel.org/torvalds/t/linux-7.0-rc3.tar.gz
Resolving git.kernel.org (git.kernel.org)... 172.105.64.184, 2a01:7e01:e001:937:0:1991:8:25
Connecting to git.kernel.org (git.kernel.org)|172.105.64.184|:443... connected.
HTTP request sent, awaiting response... 301 Moved Permanently
Location: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/snapshot/linux-7.0-rc3.tar.gz [following]
--2026-03-14 14:53:51--  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/snapshot/linux-7.0-rc3.tar.gz
Reusing existing connection to git.kernel.org:443.
HTTP request sent, awaiting response... 200 OK
Length: unspecified [application/x-gzip]
Saving to: ‘/dev/null’

/dev/null                         [                         <=>                    ] 248.03M  51.9MB/s    in 5.0s

2026-03-14 14:53:56 (49.3 MB/s) - ‘/dev/null’ saved [260080129]

# wget -O /dev/null https://git.kernel.org/torvalds/t/linux-7.0-rc3.tar.gz
--2026-03-14 14:53:58--  https://git.kernel.org/torvalds/t/linux-7.0-rc3.tar.gz
Resolving git.kernel.org (git.kernel.org)... 172.105.64.184, 2a01:7e01:e001:937:0:1991:8:25
Connecting to git.kernel.org (git.kernel.org)|172.105.64.184|:443... failed: Connection timed out.
Connecting to git.kernel.org (git.kernel.org)|2a01:7e01:e001:937:0:1991:8:25|:443... failed: Network is unreachable.

Before the 69894e5b4c5e ("netfilter: nft_connlimit: update the count
if add was skipped") commit this worked.

#regzbot introduced: 69894e5b4c5e28cda5f32af33d4a92b7a4b93b0e
#regzbot link: https://bugs.debian.org/1130336

Regards,
Salvatore
