Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73B110790
	for <regressions@lists.linux.dev>; Fri, 10 Nov 2023 09:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="JIKW4mHT"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-9dd3f4a0f5aso304529166b.1
        for <regressions@lists.linux.dev>; Fri, 10 Nov 2023 01:44:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1699609489; x=1700214289; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uNNVKkYwl/rOA9GX9/SH18oSRKfcJIfb4LTGsk7JdWQ=;
        b=JIKW4mHT+xlPK2iuRLjQHwAJ+5RzDmTa0kB4E2tQyckeKoFQen/bCBrGqDjpKTeCaK
         q6Gxth+3KGnzaJ3HWMcOZULC8elW7H58TYZEM3Jc/+sZpbS1eGAHO4Sxo4nYzQSwM/tt
         NafG55ib2/zrMQRh4/Ij5QHiyTJdckTnmzBGU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699609489; x=1700214289;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uNNVKkYwl/rOA9GX9/SH18oSRKfcJIfb4LTGsk7JdWQ=;
        b=psWUo+m3ps39detg6quN9ft1zeJ2A3rEHx//P9sFobO0u/AIurb7Yn88rkoSQ38Ah4
         F/Bp+r7JH2bqpNTlL6vdag4kxDlQdq277MbRKsRcDae9Igi0BLiQbhhSdYZPgYept11r
         grgizRWJUZi5EH1dQ42YdPTIqoC7PIYfPeUhYs3E0g2sqNmDM5ncls9d33qNEud78cNF
         dgxXhVNp+QBkYJDhMKv24ZuMiq8qtasEh8jm3RsS8tIP/wb74ntF2GsJ6HfL/YKQ/jeh
         T7CgYlC6j3YlJTuJd4hYRQqn4dBBAlX7C1S7Gn3nyzFegyQ9AFY0KXwdxRMQ6zclD4X2
         MWDg==
X-Gm-Message-State: AOJu0YzlYLfWU0q5NDWYjELuf9t7ZE31m2tNam9Kwl9BQr5QJdw0nRIK
	GhnuBwBJSlweT7+BGwxzhEFbOlHdn6IRCS43zV213Q==
X-Google-Smtp-Source: AGHT+IHEDrhaS3SWGbZqZuG8sNPuZIIpHaBGL3VI6Da90hnwL9tRuf2Y3uqzB5/P6YHOqBSOAeAfq99hTGSbttzq3wg=
X-Received: by 2002:a17:906:8910:b0:9e4:121c:c292 with SMTP id
 fr16-20020a170906891000b009e4121cc292mr3096666ejc.77.1699609488646; Fri, 10
 Nov 2023 01:44:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1699564053.git.kjlx@templeofstupid.com>
In-Reply-To: <cover.1699564053.git.kjlx@templeofstupid.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Fri, 10 Nov 2023 10:44:37 +0100
Message-ID: <CAJfpegtOKLDy-j=oi8BsT+xjFnO+Mk7=8VxSDuyi-bxhRSGMKQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] Fuse submount_lookup needs to be initialized
To: Krister Johansen <kjlx@templeofstupid.com>
Cc: linux-fsdevel@vger.kernel.org, Miklos Szeredi <mszeredi@redhat.com>, 
	linux-kernel@vger.kernel.org, German Maglione <gmaglione@redhat.com>, 
	Greg Kurz <groug@kaod.org>, Max Reitz <mreitz@redhat.com>, 
	Bernd Schubert <bernd.schubert@fastmail.fm>, 
	"Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>, 
	Naresh Kamboju <naresh.kamboju@linaro.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	"Kurmi, Suresh Kumar" <suresh.kumar.kurmi@intel.com>, "Saarinen, Jani" <jani.saarinen@intel.com>, 
	lkft-triage@lists.linaro.org, linux-kselftest@vger.kernel.org, 
	regressions@lists.linux.dev, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 9 Nov 2023 at 23:37, Krister Johansen <kjlx@templeofstupid.com> wrote:

> Either should do, but I wasn't sure which approach was preferable.

An incremental is better in this situation.   Applied and pushed.

> Thanks, and my apologies for the inconvenience.

Really no need to apologize, this happens and the best possible
outcome is that it get fixed before being released.

Thanks,
Miklos
