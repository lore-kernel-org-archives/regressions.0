Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050EB26A082
	for <regressions@lists.linux.dev>; Wed, 23 Apr 2025 15:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745420817; cv=none; b=EouPwaEm1+y8nxr+jOwiVGGGLX7ts9RxF0xjlONJZtoBl9VhsNEVmWo6MOpnlSI9KVBKVyfZ1fCrbwqSx406f3oh2UotxB4jkF1l5iyi8GJrEq2mEuakGEpR+HFxZZr3NoQrALxXyT3Db4AT0BRnoZTbs8m1nNijzvpFTXq66jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745420817; c=relaxed/simple;
	bh=htsSRWmKj/59JwlmAD9kixPrm4eAWF+MIiHbLwDyj0U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IP0K8GQQ3QylXDmtAyvhX3p3ldCG0A01c3qaecBnqLW1jiYBWzvNlMpUYDQZfmDdpy1q+gocx+kBxkOlXSMrh89Yhp8MkKtIsDuwRIBFXUVoIhGC3jtsuXZyqNvMmLZbr+O7jCagCYmlvj5MEhFSiqOwBHFyzv7GomhIFa1vrx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RLbFy7er; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RLbFy7er"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6fead317874so147807b3.0
        for <regressions@lists.linux.dev>; Wed, 23 Apr 2025 08:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745420815; x=1746025615; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=htsSRWmKj/59JwlmAD9kixPrm4eAWF+MIiHbLwDyj0U=;
        b=RLbFy7erxXqpb6W7IDJmAg7sTDHZzKWuUjFD+Sm7jK9KF48z0MF+JEMfRiEWZCxgos
         6Rl6Py1AWWScBxynVCvoT3LW1Ycxv7ocouM8Gda39VBy01FG1w/xijmzNuWde6LvkDBT
         Cu3RM76cauSZI4gzpocuAvRhJcTl4JmQX0K0V2CGgIPk0Y2MG9FFESSS69AfbXetxGcz
         8oLbU8QNgGvwxMB2LlQDt1fbX1f4ZeWC/GnTsAZAaRsRok6DcdIOx4SHRB0yJRVTM988
         d27FFxPc+1gjyNdtSlarsoenLziAeJAK47SyhBUMPoJ+oeP72qs0WmI006uyLHEiAwR7
         P0Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745420815; x=1746025615;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=htsSRWmKj/59JwlmAD9kixPrm4eAWF+MIiHbLwDyj0U=;
        b=Wd4bLlVaijzkWq89+VuJE9cVyYRGdhyzNynEqjqsHGo0iULMphI8Mb15o2Y1L4LXFX
         W6SacCeHQn4yUVvsVPkkRbeXR8fqNkdsJaAxG1/+5naNCJRqOwIdgGZ35rxqRAMbJH7Y
         CGXsg2DbhQspE034I3YivQYOFUZARMSkmPzvvbJfy/oIUHPkDQpvSmxIORoJvcu2cYke
         Jip/QYwvkQT8wujCgZckeUk0JxWLOwRE5cqrkEiPQToqAX1tMICO2HCO/bxNFMgNlS/Z
         XMip7xlmX4LlncP489+EYvnb7LC7PreqdFmpqhsPYtxiyUEjUOkX0pN3euzLT3QoryPY
         6skg==
X-Forwarded-Encrypted: i=1; AJvYcCWl0Py9yP46tYI1mA6CQ4Ey47qwcP5rQtqk6nG1ST76LixG9IVSzNk14iw+xQqyzum3hW68t3UQ7UHGTg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwOxtE7E90fR5GwqmuL0r2og+FZryguKjh1NTHPFjHrj+VhrvH0
	hTvzqAVxVIW0XEzQk9KN7370aHnfXndZxTZ5nYyexVJKAbusdgpHYiYvgzr7bt5znJ/Zv0lt/ut
	w7kbQ2G4XuqtjsoovQMrk2ml/Cf0=
X-Gm-Gg: ASbGnct6wB04pld7YytrQiK4zSnEa74b69InWI3fCowE1DA2QST/pQKxwVbl/i/NPmB
	LF88fHbIUN+HBrgKT+f2iJl9rsKmmtphR9CRQwlgyVmjuLQBsLfKpg4Wp8kq8xqcLs3s6FyFeBI
	5hmenKuMDEqR3RzFoZV/TtircxsxpAGHMRx0SfprO2/2RuYWA2Gbepkrg=
X-Google-Smtp-Source: AGHT+IHIBEUIHIUHbx3Vbq48HtHb0Q3vvCP1K7x/Cj0qJNEOs5kBxploI+OZG4Z2/M2b3tydUe4jNlJLcV2MJw2DXdM=
X-Received: by 2002:a05:690c:306:b0:6fd:359a:8fd2 with SMTP id
 00721157ae682-706ccdcdfadmr300167277b3.26.1745420814806; Wed, 23 Apr 2025
 08:06:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Z-XvFvGigpY7JYFn@debian.local> <MW5PR11MB5810B066CB7824714FF25D0CA3A22@MW5PR11MB5810.namprd11.prod.outlook.com>
In-Reply-To: <MW5PR11MB5810B066CB7824714FF25D0CA3A22@MW5PR11MB5810.namprd11.prod.outlook.com>
From: Chris Bainbridge <chris.bainbridge@gmail.com>
Date: Wed, 23 Apr 2025 16:06:44 +0100
X-Gm-Features: ATxdqUHONqKv6b1Qd7Um8aPMy1BYmw5Hsl65TqIngcUOiGOh4mZLyMDOJ0f7HwM
Message-ID: <CAP-bSRbDm_-_uqTX817zaP4HXkW3L3q0j15k2hkGxKERAK=_gQ@mail.gmail.com>
Subject: Re: [REGRESSION] iwlwifi: probe with driver iwlwifi failed with error -22
To: "Korenblit, Miriam Rachel" <miriam.rachel.korenblit@intel.com>
Cc: "Grumbach, Emmanuel" <emmanuel.grumbach@intel.com>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "kvalo@kernel.org" <kvalo@kernel.org>, 
	"Berg, Johannes" <johannes.berg@intel.com>, 
	"benjamin@sipsolutions.net" <benjamin@sipsolutions.net>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Sun, 30 Mar 2025 at 05:12, Korenblit, Miriam Rachel
<miriam.rachel.korenblit@intel.com> wrote:
>
> Hi Chris, thanks for the report.
> We have a fix for that which will be sent soon.
>
> Thanks,
> Miri

Hi, did this get fixed? v6.15-rc3 appears to still be broken.
