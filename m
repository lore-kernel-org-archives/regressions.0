Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795809548;
	b=OFA/zMnjNFqy7v6+Inih3FEtrXji0ETeW+9rf4MGxpXdPGWRVyagnX3/RVDwinSsGniT
	 aeNVapOLFoJJRS0b6ELpVCuAiAoqmpGAHp4/+3v3MdOFAt04yhDllERBLXIcqCzxxYpPu
	 SwuRk6hab5cZijSWZRlXfFFbald5Za+iAqZpxYq5F8eMNWHecjFlJGXeCbvOp0BxFgXhe
	 uKc4W2bAlugkIjhmOC/hpK61PcQgZy7oXDI9T1ormqzMAKE8UKlwwPojkUm/D+AioJ/UQ
	 EOLgH+HiXLPdqwdnFs2Raia7sLtW7WCv0Tu7BN//GI4eQotMIUXnSwuapCVGjyDQ7Yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795809548;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Content-Type:
	 MIME-Version:Content-Transfer-Encoding:Subject:From:To:Cc:Reply-To:
	 Date:Message-ID;
	bh=eDEirQQMamUNZawFJEgZuhdS2lg0tyCOVyKPInGW5TY=;
	b=ZsCCPn0kUehDHeYakZrPrjIElPXWY8Nm3PI33ds1b2jIVzg4oQetqJPWsR9wNDwVWXCs
	 /zffbAG9AS3KOOXrjvQ0yh+LRyIf0UZKPNiepNlbj9xOuSDxxkUzmPmUTQdGunxe7spMR
	 hzjvSjrBIuMC1VqfkbIRx+fIYv2vXWWV3WpB93iiw7faHDLDpUewsVTr4o8mgQcE6srKD
	 f2b9FAi7ee1YXLChc2U0fevEIdZyRnYImt8fjf1fSJQsOxg9fNLUis8yBTgSDiGa0bP/W
	 DDlH3PBJLAeap/3hN1Is2bAMuw4liVzcpUR4fcWWHL8FaC9dqdnurmq5iQptbHSF8fA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernelci.org;
	spf=pass smtp.mailfrom=kernelci.org;
	dkim=pass header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b=U1sr3Uiu;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E165606A31C
	for <regressions@lists.linux.dev>; Fri, 27 Nov 2026 19:59:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E165606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b=U1sr3Uiu
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3863db981d4so11934250eec.0
        for <regressions@lists.linux.dev>; Fri, 27 Nov 2026 11:59:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1795809547; x=1796414347; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eDEirQQMamUNZawFJEgZuhdS2lg0tyCOVyKPInGW5TY=;
        b=U1sr3UiukOUw1bgUALSgRpHz7q2UTKiWqIHa+bin/cRt72dHb8IlvL98YaiYuoGO5Q
         n1NXfhMTS8xb7K2eJYtlhHIhKkwB7l6AVmjwkWS+3KAnBcYkG+fisXBzVRcXSMJXoSRO
         yIrQUBqEA0YUT2MNuCfCLYHqS8EytXFFJUAfpXUBH25uW0iwxXbYSHWCq5H5snCdilY4
         Z59zHDbBpbmFgueW2c/fxi/QGpmKjsWJHkQPIOk5oPAMz6rKFrvAM0NOefCfzyZYrwzG
         m3uRT7sL6cGCJ/an+bvg8TIDAQ1JlRn4hSkOuZQPmoLM/WoQtxe0v8FakB6EunjXggPs
         tBcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795809547; x=1796414347;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eDEirQQMamUNZawFJEgZuhdS2lg0tyCOVyKPInGW5TY=;
        b=ZLSLeoqPNg7Wf4ILrCZYk23ck2upFCJAG7SgkQ3LwE4APA7qYZuevXmeTpMIW5BSVZ
         ETRqrXv9a7Kf7idZ/RlOWzGuaAXFYdvnBmaEeHit7c1LuVXLjyDH6rU/HQ9V2D1JaAwL
         Z2FSQzIlpix8rR5Bcm/PhALCeV10SLnEhKNkQ278NNO7zrOfCYER1mG/pZUTjv5hzTA3
         Hqaon6gkfrAz49VwEGmQ93Mv9FhYjhiqzq+GfZfngv0MIViuBvUDYc4aR94zVZo2JJsw
         cyrTTj1zgwUbGVklWijAyA3YCryuH8Wh4j+9ifgN+cdZvFM62RLBX9MXsjNkBv7fa2ug
         HeRQ==
X-Gm-Message-State: APuU4Z+XEW2c0fv3R2dlvwt8r9u7XRzF9OHBc5Iiiud0e/wHVvVr+SVN
	CvpJfQjNOinAHhuChiuUWJPEgTA4mivloF4JD2VVPcSkpHH6ZkjLOnjTzryy6k2ENVamrn9or7Z
	ym8M3
X-Gm-Gg: AZFdTZeGOuQw0XvCkmqHQveWVZhsKTc9oxmumgd92gVleBT7py+UrYqfARFfB6rkecr
	CcEv063W/Brs9zFqR1wvTiwglJprj/gWb2s5vohpL+ldS4nuBJ+iTs79zRq4fIzocgmWQIRBrhm
	Ma/ZmiUzxotq68t2NLZyNtg7Sm2i9QmjrK+XD5keaUe5/WdzKMmrl6wUVMlVJMRUZpULyEXkl71
	qeDIryCPPd3chr3vsWgCgoc7+NoShwC+hR41y9NlyFRd8FtVJOhHhk8LHg99NnaU5+7gMoRca0O
	1j4DwcpVr+cRqUklmwQesLvhoxHTDdw+rXo9aDuQNf/26oNjIesO94+zYLq6kReqbzFjU7c+94y
	/m8YjllYwwlXFVJtAgmjh/RO+F8poM+ddgooUcKFAjZ73JAdhtMvoHUtbUXWX7sR21NJ0y4tHKm
	igRSUGVIMjVNociA4fB/NpGTqYBqvb/kPCmFL3x1l4C/bo46jgTCn1SC296a5apV74RbwA4Hj7S
	ZJ3yFNKturUN38KY+PnAz9SrSsTC5W/1m0G93TwsACzZGPjPCqg3x3DI7Sp5DeaMGvbEKfqkKiP
	3wZdu2BBecbndsBN5+5/+Q==
X-Received: by 2002:a05:7301:da86:b0:386:d481:8160 with SMTP id 5a478bee46e88-386d48183aemr7586621eec.37.1795809547006;
        Fri, 27 Nov 2026 11:59:07 -0800 (PST)
Received: from 52d83ede7c60 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385d2b93dd9sm84295786eec.24.2026.11.27.11.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 11:59:06 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] mainline/master: (build)Error in
 /tmp/kci/kernel_build/pmu-events/amd_metrics.py.mypy_log (...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, broonie@kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Fri, 27 Nov 2026 19:59:06 -0000
Message-ID: <179580954555.221446.8765451637967038515@kernelci.org>

Cc from: regression/mainline.yaml

New build issue found on mainline/master:

---
Error in /tmp/kci/kernel_build/pmu-events/amd_metrics.py.mypy_log (pmu-events/Build:229) [logspec:kbuild,kbuild.other]
---

Log excerpt:
=====================================================
make[3]: *** [pmu-events/Build:229: /tmp/kci/kernel_build/pmu-events/amd_metrics.py.mypy_log] Error 1

=====================================================

When fixing this issue, please attribute this report according to the
patch submission rules:

Reported-by: kernelci.org bot <bot@kernelci.org>
Link: https://lore.kernel.org/all/179580954555.221446.8765451637967038515@kernelci.org/

For complete logs and details about the environment used, see the issue
on the KernelCI dashboard:

- dashboard: https://d.kernelci.org/i/maestro:10ef918ad7e7039c848700c156fc03fc1b2dc224
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
- commit HEAD:  822ba3a89c7896b26e4beb70e2ebffb881924dfe

# Builds where the incident occurred:

## defconfig+lab-setup+perf+perf-arm64 on (arm64):
- compiler: gcc-14
- config: None
- dashboard: https://d.kernelci.org/build/maestro:6b09d335286e1965eccee1b1

#regzbot introduced: 9437ee8b6cf607e883b36e44bd755968daaebd48..822ba3a89c7896b26e4beb70e2ebffb881924dfe
#regzbot link: https://d.kernelci.org/i/maestro:10ef918ad7e7039c848700c156fc03fc1b2dc224

#kernelci issue maestro:10ef918ad7e7039c848700c156fc03fc1b2dc224

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
