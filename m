Received: from diary.svmhdvn.name (diary.svmhdvn.name [174.136.98.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DBA81DC98C
	for <regressions@lists.linux.dev>; Sat, 21 Dec 2024 22:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=174.136.98.26
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734820945; cv=none; b=hrpkiN0LJOuwSkRDlnhO99Ipwf4XhQ1NDfnr2JPyZLtoXdntdDMYVtVps2kVssmth8lttoyICVJtizBPEmkHqasN0R9orTxjD67UKW2cG/6zAD9qEAAaZZnCt/mgt2Uy55t3OzdAK95M4iXXBxq06VnALAxSGPi2uLEy9ohsvo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734820945; c=relaxed/simple;
	bh=yS+bnikUls+gxphI2NHeQo2aumEG3eqFwSybwO5fkrE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To; b=qA7DHgPMfwyjsf38EUJZZx/MmmD9M799v/YsnAe8pKput7hhFkXH+btonNhoL3ESTgTQu7EJJWQFNewfnwwKsMY4NdORKasLAfVqZAqLWI/iS8rrOciyshEK1hO5jYZIsfr9+HfyMysvFv+uDgo4kZrG+TYU2+g7LWjYa0z733Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=svmhdvn.name; spf=pass smtp.mailfrom=svmhdvn.name; dkim=pass (2048-bit key) header.d=svmhdvn.name header.i=@svmhdvn.name header.b=trl652hQ; arc=none smtp.client-ip=174.136.98.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=svmhdvn.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=svmhdvn.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=svmhdvn.name header.i=@svmhdvn.name header.b="trl652hQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svmhdvn.name;
	s=diary1; t=1734820548;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=h9vROm/ucFrO1Zn4KeEKv/82NzYWKSb+97vYad00O+U=;
	b=trl652hQOgNnOU5zQ6CZeRa2MYaQA3yT9JHZ+kaD5IU5bLnPZ/rD2U/ES0YvhKijfUQLdV
	UG9LahF9SPPDaX94egagfw0Rps/YtczC24pZCjpocYdf9cX0SjhqZ4CNPTVLvw0Fhc/+Lc
	5QQpA3PSiG+VY+oi2cvHY/QLDRVun0GEgfXQVafTQWQ6WqYXihLF1oLmQ9D5rqYQ/hifDT
	iJWGIaMxgzCeoNrTUOGOG1bb+vm2ykjhfpg2j2lt17d+lFaS1lhQix1OSLuhr94Yn4ZtuN
	CWs3JJ4fVV1i4e2kPREX2ZvASlvlac5fwfpeStNJzdc7e/fAh7R8cPJkkZm2RQ==
Received: 
	by diary.svmhdvn.name (OpenSMTPD) with ESMTPSA id 5ec79cca (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Sat, 21 Dec 2024 22:35:46 +0000 (UTC)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 21 Dec 2024 17:35:37 -0500
Message-Id: <D6HQK0PSRVBC.XEUGZC9N1O5K@svmhdvn.name>
Subject: [REGRESSION] amdgpu: thinkpad e495 backlight brightness resets
 after suspend
Cc: <regressions@lists.linux.dev>, <stable@vger.kernel.org>,
 <amd-gfx@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <Xinhui.Pan@amd.com>, <christian.koenig@amd.com>
From: "Siva Mahadevan" <me@svmhdvn.name>
To: <alexander.deucher@amd.com>
X-Mailer: aerc 0.18.2

#regzbot introduced: 99a02eab8

Observed behaviour:
linux-stable v6.12.5 has a regression on my thinkpad e495 where
suspend/resume of the laptop results in my backlight brightness settings
to be reset to some very high value. After resume, I'm able to increase
brightness further until max brightness, but I'm not able to decrease it
anymore.

Behaviour prior to regression:
linux-stable v6.12.4 correctly maintains the same brightness setting on
the backlight that was set prior to suspend/resume.

Notes:
I bisected this issue between v6.12.4 and v6.12.5 to commit 99a02eab8
titled "drm/amdgpu: rework resume handling for display (v2)".

Hardware:
* lenovo thinkpad e495
* AMD Ryzen 5 3500U with Radeon Vega Mobile Gfx
* VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI]
  Picasso/Raven 2 [Radeon Vega Series / Radeon Vega Mobile Series]
  (rev c2)
