Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19ECB3264FD
	for <regressions@lists.linux.dev>; Sat, 19 Sep 2026 20:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789848507; cv=none; b=W66d7Qcas+tJ4YXwI2Z1rQtVAXN8vCr7CLs5WVoIODnb3oj/tIpoChfCj7YfFtQJqLqJQCcaTlgQmkFHzrdOs/j7PLzXAnqZgeBOiHyYlPTbGxaY6LXBVk31gZNBnXAlD7LWheOnpgceOxA4b1zOI6X3R5xI13HeS0K47ZJiNn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789848507; c=relaxed/simple;
	bh=fxNmcfC0DUxhlW8yN2jFhiaC+jhCzmca06tNl7zU15M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nlDLh9Vly3p1l3G0nd10iitW9H1+i4Juqbvh7uUgMm0PzQUYpv/6mRyzkCPHpUhJWkiRzmLNEy8CE3JPpl+EEd66ARf9HfVgNENa+4xqsTlqfmxzIOnpbzFrryOytsl7R8o/5Z5n5AmmJ+mfwpTjeJa3qs14JlT8gTP9PccuLPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pESf94Db; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pESf94Db"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e620fa473so10535955e9.1
        for <regressions@lists.linux.dev>; Sat, 19 Sep 2026 13:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789848504; x=1790453304; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4zH2coYvkCFk4ebyaBOaXh6iikHxkJzRaCpn2ESsA3w=;
        b=pESf94DbAgc2cU4wGHfYiHUts3THu9ntWO42EV0KIOC6KuqbwnTOYgwE1lpVrjelbr
         DUDG18spWaEBBp74+gb4y0HZLVMjINSpuAHOUT7ZSGuyGPQ6vqHXZVH3amg8HQks44zc
         D65XnUZ0HtkZR7E7MaiONw4Cf/oc0upG58ms/eFweyfXYGTK9CYZHhrhslc8QxQKnB/m
         Io6dx4SboJtm2hCNnsT8iuD3AcRJAHvqQYhuzDz1DiqDeEqU8mXJnLtlosxVQvDr0WI9
         GLkjmo54yZzCGJRjhQJRhHGUYAhQhzMe4CDWhDNfv8xmgiJ1Iwhlh2gBtycfuSNdsHkA
         nF3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789848504; x=1790453304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4zH2coYvkCFk4ebyaBOaXh6iikHxkJzRaCpn2ESsA3w=;
        b=CKcC6UJ0+kB6D7bDIqaB1UJmqFyAAleMQJwW1PhL2SpTA634v3z0NURxIl6ygnJzfl
         YtLpCqcCf+SEWnckNG+16JhSVKLsYnB7DyQCUo8r1Sq/UYxGzxriGCOtQ8Rk8GzKpMlS
         CWpXfbEEyXK/8VOg7QG6ore2D+01T4l52nveAxNFSYE9ZqK0tyN3Eo5aqZ7C0TiC8JeM
         UM1L5YVg9oNvYPBdpoTfZwMYYOJ6PRQ+4qT5yY3oKjo9IWypp6AkYDgbMVC9FCdHyaHq
         g6TgVIcj319meBlvWvvDlR9JNxbM2L8mTjXEIMDVO4rF4rkA/6wtrMuYDr2Sx8Ne8O3c
         ZyAg==
X-Forwarded-Encrypted: i=1; AKwUvByS6YohymTWsCu6U5Xjor0uvHKiUXJ31Qk77fwsHo3ofupyvY6RWaifodzcQQ/StoytTjj7ig4UlXkO6g==@lists.linux.dev
X-Gm-Message-State: AFuF++lXskIlxIPOJ6u/ZJQargpRxaF8gIDfHQgrELOsG2Fi0R4HAJ33
	36ElhKmNQy69yGnA1cmp8xvLt/vgVt6CqEPord6xX2vCrSBmJyae0WEr
X-Gm-Gg: AYBFou2XX0dt8cbWWFwqnGbEx28jfoSsO2AkCO/ZlgmHAvRRMcooIjRIx8cowXmR3mv
	8pW7E4h0aEPkexYpm4LO6jAs0iMM0lhA61jBU9p95vOcAd+DTC3MrKN61khM5UI91w38bc3XFfO
	2EEUdp8mKsQZ4rErOmzqyEIiP8mTNgXCTXlGFXEowPd99+bp9lWJfP2kRTW49EYa0jAvRgX5oCq
	PS7T1ZlILi3KGS2P7/UGle5tBlFmTL+rj8bcdRGMzh0jcUITpajC+ruVXSyExN44ZsH3OYICrXT
	PbpJukdGXvF0e7WDs2H2Bw/EC2Ay77Tj3fiypC4mCqidl+RjJI9MxoDp0w9a659rtDuG+oYeFls
	P1la5YbtGLGyjP9m1WKRXC5uSozp6VoN8jVaS4PUpT/oh85zjmT+TaGibyxPekaCMX79j+nVbF+
	CG7GLAvn3ZYejq6cDof7tApzaVlxLWzAFjk4oPRk635iMNBo+Ss5tOBh4jhJ+LPKW57rIf9svpn
	IT4GlsHTIJ6/FUNzE3r0qVjrQK9l/7tLiyURbXO30vAzgeI80XlOZCh3Bx6WORMmk9Oci8=
X-Received: by 2002:a05:600c:1989:b0:49c:e42b:a4ac with SMTP id 5b1f17b1804b1-49fc5714d14mr89393375e9.11.1789848504060;
        Sat, 19 Sep 2026 13:08:24 -0700 (PDT)
Received: from localhost ([188.234.148.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc56aab7csm115777395e9.1.2026.09.19.13.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 13:08:23 -0700 (PDT)
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <siqueira@igalia.com>,
	Alex Deucher <alexander.deucher@amd.com>
Cc: Fangzhi Zuo <Jerry.Zuo@amd.com>,
	Aurabindo Pillai <aurabindo.pillai@amd.com>,
	George Zhang <george.zhang@amd.com>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [REGRESSION 7.3] drm/amd/display: single-frame scanout corruption on DCN32 at 120 Hz since a637a140ab86
Date: Sun, 20 Sep 2026 01:08:20 +0500
Message-ID: <20260919200820.799243-1-mikhail.v.gavrilov@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902073222.206801-1-mikhail.v.gavrilov@gmail.com>
References: <20260902073222.206801-1-mikhail.v.gavrilov@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Following up on my own correction: the attribution to a637a140ab86 is back,
and this time on a comparison that does not have the flaw the first one had.

In my previous mail I withdrew the 90x figure because the rate turned out to
depend on the machine's recent load and my two runs had not controlled for
it.  I have now measured the commit against its immediate parent, in matched
conditions, and the difference is there without that confound.

  parent  1d8327353de6 ("drm/amd/display: Fix VABC Init and OLED Support")
  commit  a637a140ab86 ("drm/amd/display: Allocate DCN32/1 dmub memory to GTT")

Same machine, same display, same 3840x2160@120 mode, same .config, ordinary
desktop use, no game in either run, about eleven hours each:

                          parent            commit
  observation             11.0 h            11.6 h
  eligible frames       3,019,571         3,632,444
  events                        7               293
  per 1000 eligible        0.0023            0.0807
  95% interval      0.0006-0.0040     0.0714-0.0899

That is 35x, with the intervals more than a decade apart.

"Events" counts only frames where all three CRC registers moved, which is
what the artefact does.  The single-frame content flicker that moves only
the luma CRC serves as a built-in control, and it did not move with the
kernel: 0.0020 per 1000 on the parent against 0.0008 on the commit.


The load confound does not reach this
-------------------------------------

Both runs began immediately after a reboot, which resets the state, and
neither had any load yet in its first hour:

  parent : 0 events in 434,204 eligible frames
  commit : 52 events in 349,718 eligible frames  (0.149 per 1000)

So the difference is present before anything could have excited it.

The shape differs too, not only the rate.  On the parent the worst
five-minute bucket in eleven hours contained 2 events, and no bucket
reached 3.  On the commit the worst contained 30, and 28 of 138 buckets
reached 3 or more: the excited state comes and goes by itself there, and
on the parent it never appeared at all.

For completeness: the commit run does contain three windows where almost no
frame was eligible - roughly 14:30-15:25, 21:10-21:25 and 23:45-23:55 -
which is what fullscreen content looks like in this data, and the parent run
has no such window.  The first-hour figures above are free of that, and the
rate is normalised per eligible frame throughout, but I would rather point
it out than have it found.


What this does and does not settle
----------------------------------

It restores a637a140ab86 as the point where this starts on DCN3.2.  What I
said in the correction about the state machine still holds and is
independent of it: heavy GPU load excites the artefact, a long spell at
60 Hz or a reboot calms it, and DTN snapshots in the excited state are
byte-identical to quiet-state ones.  Those were measured on kernels that
already contain the commit; the parent simply never leaves the quiet state.

I still have no mechanism.  The commit moves every DMUB FB window out of
VRAM into GTT, and I cannot see how that produces one corrupted scanout
frame while leaving every register in the DTN dump unchanged.

The GitLab issue has been updated with the same numbers:

  https://gitlab.freedesktop.org/drm/amd/-/work_items/5714

#regzbot introduced: a637a140ab86

Thanks,
Mikhail Gavrilov
