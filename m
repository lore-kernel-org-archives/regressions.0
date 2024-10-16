Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A7B21E3C8
	for <regressions@lists.linux.dev>; Wed, 16 Oct 2024 00:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729039681; cv=none; b=tYRPHmqWE8TZ+rDnGXpEJ4aHX4OAq02MLJwyas8l6YgTSCdUJC8U0Gu5hj7BrAt3QSmIaL8IVXkgmMaWOEYEe4Vle5TM8JESnvOCQIKzQeT7WMaRD1goQkpRZB5gfgSAuqc5zTq8Y/W/JAlFJMLeImD6WwXd0S5bkoK4mL3lZ6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729039681; c=relaxed/simple;
	bh=coKtNqO6vfpoYegYa0XEjPkHmyZ+gwYV2lAdsNugEPk=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=qfd0qEtDqmw7AanTi9XPRxzbxpWdzX8CtuCXsbaHR6WZChuWSLnnR8EJV+SbYoMMbgzGxqHyzCpOmInzAUcC4+BP22r3d0sc2oaxdhtIuuUt2vnHUjpWeiieTrKQECBvRSoKaffTv/Hf8uiP/98qBbzpatNcD5SNIn22McG2qDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=utexas.edu; spf=pass smtp.mailfrom=utexas.edu; dkim=pass (2048-bit key) header.d=utexas.edu header.i=@utexas.edu header.b=J013FBxT; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=utexas.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=utexas.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=utexas.edu header.i=@utexas.edu header.b="J013FBxT"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2e2bb1efe78so284008a91.1
        for <regressions@lists.linux.dev>; Tue, 15 Oct 2024 17:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=utexas.edu; s=google; t=1729039679; x=1729644479; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ewKdjpc+5ZwBL2qTSzgeCjZHe9uwYymKdJd3b8Yjcr4=;
        b=J013FBxTo/pzzwvjtj0p7Ca8q2dvAKWphEqx50uJe+rZrE5/cL9GR/DzRoYi0ThHD/
         jIijjtxokZwsR5hEwd7q+H5cAyyTdR5FJIDo1L2FfH7CzsIE7QzUT4/TlkPf6cficOHJ
         YNzMBNqZjKoX9rWfJ6+82tNZDrVMwN8miJQ+idoMBlxBc5OqyCeflekLdejNjpP/wk4O
         Q+9SyIPVO1U5BUyX6/8UA/8tm5/fI2m06zsZxdGvWInn6OwtC/dOUIsk0NWt2yUNT6rx
         OfV4wC+KXGLwEsrSSViNnYaBTmPjl58/beKlS85+LvM8DnJcAERfIc7vsjg+KUzLPK5U
         0z5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729039679; x=1729644479;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ewKdjpc+5ZwBL2qTSzgeCjZHe9uwYymKdJd3b8Yjcr4=;
        b=QWsAZNDOX183Eqn72tJ6OAvxnYIcW832Z8aijGjhAqvQiICN1Mv6sMUuUL2RFus331
         3EB8+xfFsKfjon5+W2yc9EHnEHfRI52ClYogwYpwT061qGY9xWDm1LBqCSIkYXMHtN68
         GH21b9gceF8E56ml9421VqYWCEdZZEbhKQGgdkzTN7YvgR7eOEWxOcFH5Wnz4xlP76MN
         /v/XZY/OBofRsB72jc0KkKGvpx5teF7y0PDgOkoyfwHnghqDHpY8HqRKEyjfhmLSrsQn
         oJWR31Q3CtyAE4fUG3DjUDe8ji+2J5ehReBaZoJ421PHXg1m8lVGXYnReqy644xI6uf/
         Ekxg==
X-Gm-Message-State: AOJu0YxXG8BydDDcPmbNGDzv565TUiIn5sjRWb55lDd90s6AOKA/RHb5
	GgI7NLAqutm/3kEJHtoSfqpOEFIxNR34evZQxdMxfv/R1DXX3THSi+RXIBz8fzbK/qX8FaokDhV
	GIeL4iRFeTIGM/gREkppZlhVF8XNQ0obk8LSa9w==
X-Google-Smtp-Source: AGHT+IHC68V6BB7DAt1UmNYyzfxuCfraF22LPY3tmnvw5T5h1P9t3EtI0PboOPF9x1x0zuNKk5wPF1ozqHzJabHfdD0=
X-Received: by 2002:a17:90a:f00e:b0:2e2:85b8:14e with SMTP id
 98e67ed59e1d1-2e3aa1514b7mr3694923a91.15.1729039678887; Tue, 15 Oct 2024
 17:47:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Dean Matthew Menezes <dean.menezes@utexas.edu>
Date: Tue, 15 Oct 2024 19:47:22 -0500
Message-ID: <CAEkK70Tke7UxMEEKgRLMntSYeMqiv0PC8st72VYnBVQD-KcqVw@mail.gmail.com>
Subject: No sound on speakers X1 Carbon Gen 12
To: stable@vger.kernel.org
Cc: regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

I am not getting sound on the speakers on my Thinkpad X1 Carbon Gen 12
with kernel 6.11.2  The sound is working in kernel 6.8

Dean Menezes
