Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983212868B0
	for <regressions@lists.linux.dev>; Sun,  8 Mar 2026 09:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772963031; cv=pass; b=DF8HnwWViMMoWR01olTpKx9XtLN0tZDZ3BSjg2/pNVAgz/xfV7V/snjTbNJx+K24DYOlkX/0+yZzysScfv7TTwHeYqK2VvuOV0Rlq8ajte7A3aaBwN9+biIQ0XzWUcpIWFR5TkCa6TnlrG4+eIzogOZ41vho6Eu68Tk506g2D/A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772963031; c=relaxed/simple;
	bh=QZ3zs9sgVddDi793qqx9GCkihBskMqNr2xNe/QJf9C0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=BPxPw1Q/BlB7WO4V+5TZB+2pt9ArXA4s1G1Bnj1kugPt5EAOquLHvIXEz6jlvZMEeEnGCZfYnUlI1irpypQJYvXDBoz5SLQGRM2ldwSdNytOQcDX6KonlE8kiknqrRtsW0UXmYmq9yA3sT0UVn+l0xauTgOQjaga/Z+a7u1hk04=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EphsDtiB; arc=pass smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EphsDtiB"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-7986fb839f5so92585807b3.0
        for <regressions@lists.linux.dev>; Sun, 08 Mar 2026 01:43:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772963028; cv=none;
        d=google.com; s=arc-20240605;
        b=SeOLzzSx/3FsH7FtjNk/PbIjw25ydcvyBra6FL/xT0FbAuw6mvhestHVndsdEqivoH
         QZj0W2ZFHVFcCzhXn6KtTaN9exP5s52WVOrKOOxaMHOr5oR+TOBAcNGsJWl7FVqliW6u
         e0H25LByj45REnmYkpDXsYk1XBjRZHbbq8XiZiH4SwehFr2mY8C5aDRY3YLDEe+nTDJ5
         5ImeetPmc8qLu4rhbrHgXQzYbkHXXv6JaDAZL5E3i6lIhucTerD6EPaeaa0Y3igrzr2/
         kENevWGjdjoAgg/oMfr1gqW1E7ZImRQLuAkmoMqSJHlUcYM+O0yf0lWdeK3W4CEgwJ0v
         TVHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=zktwThrJdWq3kBHVGGUBRgfeie90jX4lYf1F8zPH1CY=;
        fh=VMSZDy67JbtICA61VAUG8CamZaF/KLvDFjqY8hSo1lw=;
        b=aeA+Br6TruRm7BsEVQDtWkiTl0HBfYB9JgB6s9ubEybORZt2KqlhImeEvB+sQW9023
         NXXUsrsIQ05ftHGNXm3OW7X+SR+rouvWI4hsleNz1b1I0Z+s9BTK3RDYhnhkhjl7v4ZF
         zq5IQ7z3Hc7ydhNsS4haM3/wQ+gHUEH4HmBMrqWUmQy4s6Gc30GALFZA+kpJLMMDYGh0
         VD9a1svBqS3VsGLifNA6kJLFuihJAv0J6QHFA2QvOduumLiUuzEx/4T0DKNHGxJPWpai
         8+M/BC5hs49DPXNi9eVchmbOmfwoJitgdMkFBSXoUZpyMRY+j2ILf8Y5v0j0RO1+l0oi
         txjA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772963028; x=1773567828; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zktwThrJdWq3kBHVGGUBRgfeie90jX4lYf1F8zPH1CY=;
        b=EphsDtiBiHktYz321GXJUzirjS7HYBdSDhDxbw8zMtQ6RfvlhQiAfiN8ga9nCIGBhU
         8YCLuSLKbPseXBN2dc9rFB0VSJwzBGuhvj8aZz6wOAHBLWXuPidVoPuTvqFvrNCDuefQ
         aFW5BknSrod3rjU/C+auT2kkx15SNnBVynqT8gE7wi4+/HOdExX2S5N6YTEwGkA+7FRY
         RPtRehAvLyFfosSv8YzW2ktbSWbxy+2B5B50AFm4dgmWPkv+9qMbLcHabSYLiWflXbYO
         ulVbl+RznLEU2Wajv322zZjgZD6EBA4J9hu2L1fQxm/qAor4JvMZhnkGrcgUtV9tIAY1
         PCDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772963028; x=1773567828;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zktwThrJdWq3kBHVGGUBRgfeie90jX4lYf1F8zPH1CY=;
        b=A1GI+c0hOgegfRPhaVJYz1C5JW0nXCJzisOai1RgeiIFookUAFeAv0b9RHHWjSsElY
         T9gF/wcR7bK/6maosweztJeCXrOFqiRv5IXcdYNUN6Q9oTbX6KEPeUdtwnCCazXRqt39
         3TVW1Wsq1OCmfEo9RVhQhnBmaiRtsjEZC7/nQEIRJyshg38OrQV77wu4DlEvpJ1RRsLA
         XvrcOhuRvL8c/9aDx2bNYnC+iKyekdENwcvLuDj5hHiNCZ7WEUV1mO9Yl5VDVUVdI+MU
         rPSfLIRoTFafb1usGui8nwv8jO/23/W3HABlo2YlqOuceue9d0orHOS8mcmCIBdkR+qG
         FSAg==
X-Gm-Message-State: AOJu0YwuNWZGdjkqNB6Rw3Zy+x88j7mVNjT/uwCc+3UaxsQcTRMMFD0T
	3TBBlGMbezkEllw0wGMFWFLgjkCPs1wb5ah5Kbtz+EdtwO3LNZd4mniEh4I/L8Dr+sTMHE+XjOS
	eDDa4f5UC35LWw3QTz1WGYiUfwCoISTo=
X-Gm-Gg: ATEYQzyDU2ZOfbWABhSHKyC3JcGjXCiyuxL/sL/6B1Q97mNab+cvJ9Io9z8s/lp8Mn6
	0IRzQ4U8P05vw3uYW5gtfnpm53n7XzX4EQry4s+tU3kJhwGvddHZUqtf/p7e41SfXGuWdGtHICN
	qKglH15IFLz1aQm+fwYZOu5FtNpa6jhC9whnmgqNXY4+I0ip5zKVV556qAn8R7vLYBJ77ztNKS/
	F+czaj98yXHBxlLgRKl/rrHH4Rd18wJyPu2N+xrwo+3Epjf0spOSVxcrjMYHZaExWAoXVtxJP6/
	4Ji3Q8U8
X-Received: by 2002:a05:690c:498f:b0:796:3981:fd6e with SMTP id
 00721157ae682-798dd678955mr72002307b3.10.1772963028584; Sun, 08 Mar 2026
 01:43:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: hgfdgjn <shichuanyim@gmail.com>
Date: Sun, 8 Mar 2026 17:42:39 +0800
X-Gm-Features: AaiRm53utfIeCUEKgMYi5TWq9-UKPrGZ-oYJqtHpIraEicoLZaovu6NI_AwZsTE
Message-ID: <CA+tjKGrmADg=oG9CT74_mgGNN3h17=LLmnv51K=MggAqo7q2Eg@mail.gmail.com>
Subject: [BUG] HDMI monitor shows no signal when the refresh rate is higher
 than the default 60Hz
To: stable@vger.kernel.org
Cc: regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi maintainers:

  After updating to v6.19.6 on Arch Linux, if I set the refresh rate
higher than 60Hz, the monitor displays "No Signal".
I tried bisecting and found:
> # first bad commit: [3471b9a31ce352ffb343cf02a991261880aac3a7] drm/amd/display: Rework HDMI data channel reads

This issue on my machine was caused by this change:

diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_ddc.c
b/drivers/gpu/drm/amd/display/dc/link/protocols/link_ddc.c
index 267180e7bc48..5d2bcce2f669 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_ddc.c
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_ddc.c
@@ -549,7 +549,8 @@ void write_scdc_data(struct ddc_service *ddc_service,
     /*Lower than 340 Scramble bit from SCDC caps*/

     if (ddc_service->link->local_sink &&
-        ddc_service->link->local_sink->edid_caps.panel_patch.skip_scdc_overwrite)
+        (ddc_service->link->local_sink->edid_caps.panel_patch.skip_scdc_overwrite
||
+        !ddc_service->link->local_sink->edid_caps.scdc_present))
         return;

     link_query_ddc_data(ddc_service, slave_address, &offset,


It appears that scdc_present is always false on my device.
I reverted the change to write_scdc_data(), and the monitor works
normally at high refresh rates.
