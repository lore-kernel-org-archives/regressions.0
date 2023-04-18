Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC545C94A
	for <regressions@lists.linux.dev>; Tue, 18 Apr 2023 21:33:02 +0000 (UTC)
Received: by mail-qv1-f52.google.com with SMTP id m16so18902464qvx.9
        for <regressions@lists.linux.dev>; Tue, 18 Apr 2023 14:33:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681853582; x=1684445582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FcixbIsW3kO64h6Jtj5sJY2E9ztLhq82+LQGVeq96m8=;
        b=dsP1TmWizw3N+PDB2MUwhxT4Ej85EjCTFMF7vdg3SUdZayCbLomYJorXgYYH9vl1zD
         rH1v/SbxIbQCin/GLsP43Jk0tVJfYazvl880heo+zjDegGj8ohdDaksvMLJdVenzgHNJ
         oAVGbNzD/M7+UPSsZPu+mJi5GoZ6iVWz2PZXFoC9N98LQW1E7MeqcUxHeoV6SfIDOXnx
         kUFITWxtPpDe/CJb9p5nnsBIh0diBak1ih5nHsi0AbeEzrRUprtr2bhmvAtQcAuIcYP3
         eljP3gHrgS9DaOU8gVzdafCjnD7BTHJeoYZ+1G2M+lSyRzAA7Rsnbfk0CILWOmqLl33u
         feTA==
X-Gm-Message-State: AAQBX9cldc3Glrnxrvi9qekWxkasBB5ZcJvQyVTcerI/knofWoSNnFYY
	qv90jze5MrkEKc+IUjxUpv8=
X-Google-Smtp-Source: AKy350bEq70ceFE7+W1TpymqrSVvydtzlM1MkpbnuWmZgo0ndiXdLjyliZhRp3htjRDp6fJxK0qN3g==
X-Received: by 2002:a05:6214:1304:b0:5e8:63ae:a9a9 with SMTP id pn4-20020a056214130400b005e863aea9a9mr29773327qvb.47.1681853581644;
        Tue, 18 Apr 2023 14:33:01 -0700 (PDT)
Received: from Belldandy-Slimbook.tail03774.ts.net ([32.221.209.96])
        by smtp.gmail.com with ESMTPSA id u5-20020a05620a454500b0074debbb36b1sm2008309qkp.69.2023.04.18.14.33.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Apr 2023 14:33:01 -0700 (PDT)
From: Neal Gompa <neal@gompa.dev>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: David Sterba <dsterba@suse.com>,
	David Sterba <dsterba@suse.cz>,
	linux-kernel@vger.kernel.org,
	Rafael Wysocki <rafael@kernel.org>,
	Chris Mason <clm@meta.com>,
	Boris Burkov <boris@bur.io>,
	regressions@leemhuis.info,
	regressions@lists.linux.dev,
	Neal Gompa <neal@gompa.dev>
Subject: Re: Linux regressions report for mainline [2023-04-16]
Date: Tue, 18 Apr 2023 17:32:28 -0400
Message-Id: <20230418213228.1273218-1-neal@gompa.dev>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <CAHk-=wjL7GG9s9Y2+u2725M+Ru=bUXnzOnXRwoSktY0fVdhhzw@mail.gmail.com>
References: <CAHk-=wjL7GG9s9Y2+u2725M+Ru=bUXnzOnXRwoSktY0fVdhhzw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Linus and David,

I'm the guy that sort of kickstarted this whole thing a year ago.
From my perspective in Fedora-land, we've been running automatic
weekly fstrim on every Fedora system for three years now[1] and
have not received any complaints about SSDs pushing daises from
that.

When we started discussing btrfs discard=async within Fedora
two years ago[2], I started soliciting feedback and information
from the Btrfs developers I was regularly working with at the time.

Last year, I had a face-to-face with Chris Mason and we discussed
the idea in depth and decided to go for this, based on both Fedora's
data with consumer disks and Facebook's data with their datacenters.

The only real surprise we had was the so-called "discard storm",
which Boris Burkov made adjustments to resolve a couple weeks ago[3].

With all that context in mind, I'm not sure we really should be panicking
about having async discard enabled, since it's the same operation
that the fstrim timer was doing before, just queued by btrfs itself instead.

So personally, I would prefer *not* to revert the new default.

Thanks in advance and best regards,
Neal

[1]: https://fedoraproject.org/wiki/Changes/EnableFSTrimTimer
[2]: https://pagure.io/fedora-btrfs/project/issue/6
[3]: https://lore.kernel.org/linux-btrfs/cover.1680723651.git.boris@bur.io/T/#t


-- 
真実はいつも一つ！/ Always, there's only one truth!
