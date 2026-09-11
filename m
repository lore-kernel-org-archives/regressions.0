Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897674A3D58
	for <regressions@lists.linux.dev>; Fri, 11 Sep 2026 16:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789145956; cv=none; b=Vy+RUFyxowNYKnU8cxeAwXF3DiUJT1Rb/AtzOnPAuJrZ0+bgZzoxq25vkR8ZaTaLCRwBSYJa469wtt58n49FkQqHcpbQVbOaozE7SwXE4uyE3cE10yXPIYLYcU9bi95mgPNUvDXwsIJGPKfE9y76POFkRJaAR6iTnWbz7Bd5eX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789145956; c=relaxed/simple;
	bh=2xFq+mJLGKsr1RwrzUjn2Avzut/7ZC8X+I2KGp6BxFo=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=jrNMr4gzTpmwtQP6RiSN2HXOmkcj3sOJPkO95JCsnU/B5CQJ59sno1hmlAMOUmdbSrFkOK7VPCsJKiJqAJw9Xcf0k9iKMbmDTfV8oMwvtWtV/6OZ3SnXchJGw03s8/goniBNQVjsUyRyyym0rNg2Dcbmusfv/Q5lJsFJuyYf+/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=G9BXc615; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="G9BXc615"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7f4f824de5dso547669a34.2
        for <regressions@lists.linux.dev>; Fri, 11 Sep 2026 09:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1789145946; x=1789750746; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SRtWZSQeyKNAMCOPqyycUsTBH2sja6J1xsz9HJwDp0c=;
        b=G9BXc615wjIiUShhAWC+ceM+IX0tTtE+HQF9X9U6DAMb24fZDbU8PdtqyyZctz4pR5
         kHLuDCilOEW6fOjgJvHgV0rxkeCsqCgq+Ak9zVXhANaRiN2kwIuwgzOKVrZUbGMqy2Xy
         xTVSRrR+ivoKAMGAWXJD/B7nnBl0TuyHl91588ongAGZ4+CJTKM/DV0iN9JhxTHXnQ3j
         6J6dN+C1qPKPscGvTR6lVI8U7BXNrjmfuLzRhWpR1hB++ziXEj0V04/5xEFvpcogj/rt
         VrewzASNk1Y/753DtisWhebZ93MIvCAxcWAY360p527EdDaBsso50TSu1M8nTEFFSiMy
         FLkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789145946; x=1789750746;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SRtWZSQeyKNAMCOPqyycUsTBH2sja6J1xsz9HJwDp0c=;
        b=DEhCh04NZ5d8hkprZFGQfg6MUeyrO0QGhftSsAfFp+yFvAy7wCef9bkZ1qWf/W7NWw
         RMW0D/OZ1wcP4Z6pftXm0XGmVelFu226s7z6uT/PrsiE3RGE5utgmJNcjPhxEi4xC/de
         LFSLiPLCE79p9hFOxV2KxcOUX7ZZYdItyWOVOze6qIfUz9k693CcxWjiuYBhkD/DQ4Wi
         Cz47dP6j6HTgIzilld6J2mCdZV8JtVoc+8OvVxCBPgktNHhpbpTneCPSBjJO6n4gDCHg
         FGSjvKXRtjZAMdi0gyzbeTU++gCcQufJxhv4lzNkx7GccuR71wGr/TwVltB+3zlbax1l
         PP7g==
X-Gm-Message-State: AFuF++kEsMkrvoFuiEghemWhjqbQdQHREfUw05Wnv0qsLkSCADa+V6xx
	Bbo8JBDLnKifE/XdOt/XpbSGatvWiPJAtJjybIK12KaL1pGUc2in4fklPN6v1RBHj0c=
X-Gm-Gg: AYBFou283FiDAcJd6ULWa8PNfOZf/EvjzVzUWC/YXfiZ1cKSNPtILRH/pN4KdhFoYpr
	jENOnOuaakVyOINLjhwNzKBeHwmEiMFhk9v9FHIeH5jj5dSqxFGAv9SyE0EBwnb3bPJ5fw8yD0o
	mgRufBcMFubNKf1lCIWUqxeXKuxwfmImVn5KOMzMxFoD+0dSNToxODyctYSa4pCFi9NdaN2z2py
	M0qMdARipEhwOZpGKz8kEdXoHdAfTep8F2MYonJU2SOMqAQbSBxDNCqUqOIEW8sah67gB8Pjh9u
	e9NT3aPtWBA4e61GxPSPcliN3UO0UiZFdUpJIgfyhMYUv6nFFG2jSYVQvJ5jlPJih5/WnaaRB6L
	a9lKsI5ZakVDgAlYhT85gsv4GaCgROVPM7em4KLlJD3ikngivWL++tKypipimxxkEw/GNBfhf23
	sXQN6HwiTmS8WPuogcaKxglvu3Hq1/BMJ3b3gKxLY3poOKo0Xatc9+6xrtEhroz2ET7qgM37X2K
	w==
X-Received: by 2002:a05:6830:67e7:b0:7fa:ab72:9df8 with SMTP id 46e09a7af769-803ff4481a3mr4129270a34.16.1789145945784;
        Fri, 11 Sep 2026 09:59:05 -0700 (PDT)
Received: from 41049dfc76e5 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f59ea4a6sm2818725a34.5.2026.09.11.09.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 09:59:05 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] next/master: (build)unused function 'parse_edid_cea'
 [-Werror,-Wunused-function] in dri...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Fri, 11 Sep 2026 16:59:04 -0000
Message-ID: <178914594374.4423.11399857311284391817@kernelci.org>

New build issue found on next/master:

---
unused function 'parse_edid_cea' [-Werror,-Wunused-function] in drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_connector.o (drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_connector.c) [logspec:kbuild,kbuild.compiler.error]
---

Log excerpt:
=====================================================
/tmp/kci/linux/drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_connector.c:3690:23: error: unused function 'parse_edid_cea' [-Werror,-Wunused-function]
 3690 | STATIC_IFN_KUNIT bool parse_edid_cea(struct amdgpu_dm_connector *aconnector,
      |                       ^~~~~~~~~~~~~~
1 error generated.

=====================================================

When fixing this issue, please attribute this report according to the
patch submission rules:

Reported-by: kernelci.org bot <bot@kernelci.org>
Link: https://lore.kernel.org/all/178914594374.4423.11399857311284391817@kernelci.org/

For complete logs and details about the environment used, see the issue
on the KernelCI dashboard:

- dashboard: https://d.kernelci.org/i/maestro:2cd0ade6ddcd35907ea4715e9aedcfbb461a8dc5
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  68142f986ff04b2b70b31db00f719bf690f64a9a
- tags: next-20260911

# Builds where the incident occurred:

## x86_64_defconfig+kselftest+x86-board on (x86_64):
- compiler: clang-21
- config: None
- dashboard: https://d.kernelci.org/build/maestro:6aa4271720239ade90232fa2

#regzbot introduced: f2bfbc3554ca6919484030729424b9dee2942d24..68142f986ff04b2b70b31db00f719bf690f64a9a
#regzbot link: https://d.kernelci.org/i/maestro:2cd0ade6ddcd35907ea4715e9aedcfbb461a8dc5

#kernelci issue maestro:2cd0ade6ddcd35907ea4715e9aedcfbb461a8dc5

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
