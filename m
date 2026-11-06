Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794005619;
	b=XnnBBltj9AZ0iNV+Nf1eYEuaGQVcTQZBHqZf7/rQNjCsv3LHHuKpTDpOLfy57+tSZ/UO
	 7jqKMk19eI0zgxhVyoIgZktIcxhH8eXYoqpmMzG5a6jqH/xq7BsnAj1HvX90Ykqnbiklh
	 VkFUKJeodOflPdY36d3GgWUEzDhLM6v/L9s+Se9pZwuo1VgiaEkBqIlISIKnNol7yDSqX
	 DtzZ9haaeznz9kB3RS72MLdt4fI3jDiuFh29G97Jkwj8lQSUo30r9i04VPkh4BRAQKa62
	 8e+JCwX/jcuSH2PeroWrFw5VU3ESPXSoOYQEopGa2oiOragZUZWcJxmPwn3b4FqDmJw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794005619;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=Ajm8sLkLzuE5Epa/6nTv9uoiRj/UyFkuhiq7gPfP9qc=;
	b=iyK8d2ftoRBJEWFIOXesj3UkeGffpn3BHoVfyAfS8xfvCNlInBqLbidZ31rFkyoltzya
	 RggoYR6+U5pW7p5vlFFYHSvtOaTokCnDOPp+Kw/cORdqep9hOjbbu+UYfSYTlDxOUD5A4
	 coeFq1PsLHgmr+CgnoYzsA8sScY7zp2ZNG+9LVyy6cIZUSolrT7aVDEHv3/MfL/77hERH
	 QJfxuSr1RwLNzK0rb4kOd28AGmL/JxZQY8iG/3LJA/Dk1eq4m3OrLWyjG3q+Lw/QkDuld
	 rBOPL5hDOqenfUuNzzaRFkJC7aQxKQSja4E3dQZHf7yFqRNb0hrIq8QiSVLq9xp8GRA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gEoxJens;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.177
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71120606A32E
	for <regressions@lists.linux.dev>; Fri,  6 Nov 2026 22:53:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71120606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gEoxJens
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5ead32bc7d8so763364e0c.1
        for <regressions@lists.linux.dev>; Fri, 06 Nov 2026 14:53:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794005618; cv=none;
        d=google.com; s=arc-20260327;
        b=GnHB7IrqJmtaTNbWGiMUGmQZg7hRN2USKYyzLdN3XuXFScosQWT+JYfztkirzk1oMd
         euH1JmYrjKRcGoraDQq09rO555Inp2HSdeOjqAiMA3HnUu+71QvBzY4CpU+eJHhF6Bm/
         cjS7RnMrCsclrw7YO6EpAJ8w5ctR+JKu6WnA0F+qi/73X+KXWd+GgfVuc2Uhz1ekDkQj
         FQ7qZdL9bI4EKegTNr4xmi3xFD1osD3OJ6lQZy/1TVmVygDEbi4q5uGP+sLgpJcAwgLn
         g32vkn6CCWzFwRQoa8oEqbZ8woiWh3htTj1wJuef+RQWWWVZTBZCfo9eCfbJoxT/nCiS
         WvKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=Ajm8sLkLzuE5Epa/6nTv9uoiRj/UyFkuhiq7gPfP9qc=;
        fh=P715bXDl92c1rdAru04uzG+KekgxbE4BrGaGnTZZbw0=;
        b=OCFFgkbgfpNRHCq4TFM2qT1u+gWBRqlsDSHv0yTzkxDeNEl+Y+jUyY4ElSrpcML3tT
         GeGgqS3DWIzr/uyNGfXnqq6RzJIeJsMv8lCpTYDIuT7/S4NmRmzw2K15SW5bohfyFbMN
         iWceArjpgDlJ918D9ecnY3WZ8qc5GRrCkKgr7HzM0cCwtVvhy13sc6XWl8o8zlmGcBkZ
         nBPpenaAI43DdaoGW439Gdnt2S3omcTDCDa+lEwtAmB3/wVKsBglxRiIzig3IKReyrtj
         Y50xgux9HGLHXCWZ0hUARxjn0s06CxmoS0dOntbywsVsBizpMIIQgCfP9nC4h0sB2AvS
         iGfA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794005618; x=1794610418; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ajm8sLkLzuE5Epa/6nTv9uoiRj/UyFkuhiq7gPfP9qc=;
        b=gEoxJensFCIx1xEqTrBeJ6APdzriUS60zTlSkjsfcbR1Yl1j4eas4lV2QFmRjvUQnj
         A4tnWDJgRA/RNAd+aNjRIK6QWzNDXU+LGwadvl9C+ZQzsyJnzYmpk83TsBUxrc6sZGxx
         +aBy60dPhWasIgYe844weFmNXaPL5ySKDtNX8UY1TSNlM9jQ9UGCkSy0L3rUllEIg41S
         Lh2dT+NlxbBblIx1BU+QrqPKUhIRhk5XD2DAhh7ZS2/fH3fjqu4LVg6ancZjFlOKMR/v
         eRlVWr1YUgwWeOsoM20d1fqqXpfHZ6ho18X94sEGlhnMn9pjD7ThJ2cW2A5vNVDrkfRh
         ZwtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794005618; x=1794610418;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Ajm8sLkLzuE5Epa/6nTv9uoiRj/UyFkuhiq7gPfP9qc=;
        b=Vhwi7eY1zA9w7AlyxaKClwu3UsSXbfMd5iSq79JSlDAh1U1/SS5tosrOL/1jq4WSJS
         ZTd3xsyIsugNzPj53FN8Uf0zpwlLBajQ/gbIxsr6ojUkD/ZY3xcZiwFHbBZrITSwUWMX
         BLR5jeo7ANtAr6FHBK45ksFpERFkXesMM9isbS4qT9R27Y4LNXW3j2xvJkAd5oDBoqta
         cphav4EanoDF4p9NSmCoJcQMxEaB1+4zEqazxNTdjw6A+Xhj9aCqWa3Biv2meSzcyuav
         6WjWmnbvlsWoRr140Ch9J79whEsuHR8cL1DvF23FAR/JRA2IiFGaGtBwbeaFl5y59Znx
         fqZw==
X-Forwarded-Encrypted: i=1; AL+hErEt2Ez4r1Vvrrzr5EBf+vOIum3s6IuYLfwZc/3LO754KckwRTch7FIjDviSd1C9YcbbZICWH6RlpFa08Q==@lists.linux.dev
X-Gm-Message-State: APuU4Z9eKQhsBKQuQO/PStuQi+477/gYw31ww2ThI/pim9qx95y2PXzF
	XovQlC547iTketmHQCseuHhLqTE3K+WmJAr9LTuYm+EZTUW9WjaASzkFkz9T3D+I16cHWrErV0c
	dwjcBAE9NarsJ31Z22EVUvg8ocQEpuE0=
X-Gm-Gg: AYBFou119UkF5hBu6936EV48e3BBwGAA7Yw8vQ5VYI8XB+ZesLFdU7SMHVUFzapG5eS
	C15KEFahIaweqDpTWcupT0kmjXoVqaKnuwOig0n/vsY9Gmn06klzpjhphqq5jLnolT9n854cs3o
	GBL+s2RiWU9c4eA4IHv5iHPhzUJh4OPbdN3DYzK/YN8edSHcI/Cm6GkbNzv4bEU3z+BTi0kbS2y
	vvnzd74w/9uJFE8qfkKMux5AOdk/k9VvDhutGKvu+xoVe4a/UUdVXlmPbMWJpaatqmsREZDQLUV
	iHh5QhpdPDYZ+ncKDSmorsXbW37cQw6MDEIZnn6eZ1NrJazpxn3N4hmKmZVd5YNCOraRoPrew3I
	CsjwrkbCKuyEtF27LpDC6aR3QftTkRb2Vf/qR8OYzem6/cOR7rFWzV+lOimGCYWuo8OU=
X-Received: by 2002:a05:6122:414d:b0:5c9:a60b:e5a2 with SMTP id
 71dfb90a1353d-5ecc43e92b9mr2123325e0c.13.1794005618292; Fri, 06 Nov 2026
 14:53:38 -0800 (PST)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
From: Simone Colombo <colombo.simone@gmail.com>
Date: Fri, 6 Nov 2026 23:53:27 +0100
X-Gm-Features: AclHuK84MI38ZArBzdnoV44X2oKuSHS27JZC_ylfinDrucJDKKjxSJ7q9SXKu8w
Message-ID: <CAEVL6QtFUCs66EtLFj6dO8DQq9YE0Corvy3BTj-9HEvPkTP7xg@mail.gmail.com>
Subject: [REGRESSION] 6.1.191: NULL pointer dereference in ext4_mb_load_buddy_gfp()
To: stable@vger.kernel.org
Cc: linux-ext4@vger.kernel.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi,

Since 6.1.191, mkdir() on ext4 can oops with a NULL pointer dereference in
ext4_mb_load_buddy_gfp(). 6.1.190 does not, in the same test.

  BUG: kernel NULL pointer dereference, address: 0000000000000000
  CPU: 0 PID: 60 Comm: mkdir Not tainted 6.1.191 #1
  RIP: 0010:folio_test_uptodate+0x0/0xc
  Call Trace:
   ext4_mb_load_buddy_gfp+0xcb/0x351
   ext4_mb_regular_allocator+0x3bb/0x82d
   ext4_mb_new_blocks+0x392/0x93f
   ext4_ext_map_blocks+0xd5a/0xecd
   ext4_map_blocks+0x26b/0x47b
   ext4_getblk+0xca/0x243
   ext4_bread+0x6/0x45
   ext4_append+0xc2/0x158
   ext4_init_new_dir+0x5d/0x103
   ext4_mkdir+0xfa/0x249
   vfs_mkdir+0x74/0x8c
   do_mkdirat+0x81/0xc1
   __x64_sys_mkdir+0x1d/0x21

(This trace is from a test build of v6.1.191 with KALLSYMS; our production
build of 6.1.191 oopses at the same instruction.)

6.1.191 picked up these two as prerequisites of "ext4: fix e4b bitmap
inconsistency reports" (Stable-dep-of: bdc56a9c46b2):

  99b150d84e49 ("ext4: convert bd_bitmap_page to bd_bitmap_folio")
  5eea586b47f0 ("ext4: convert bd_buddy_page to bd_buddy_folio")

They check __filemap_get_folio() only with IS_ERR(), which relies on
"mm: return an ERR_PTR from __filemap_get_folio" (6.4). In 6.1,
__filemap_get_folio() still returns NULL when the folio isn't cached, so
a buddy cache miss in ext4_mb_load_buddy_gfp() ends up in
folio_test_uptodate(NULL).

We first hit it on first boot right after growing a mounted ext4 with
resize2fs, but it only needs memory pressure. Reproducer in QEMU
(x86_64, 320 MiB guest, NVMe disk):

  mkfs.ext4 -b 4096 disk.img 244224   # on a 4 GiB image
  # in the guest:
  mount /dev/nvme0n1 /mnt
  resize2fs /dev/nvme0n1              # optional, makes it more likely
  # fill a 200 MiB tmpfs, write and delete 300 MiB on /mnt, then:
  for i in $(seq 40); do mkdir /mnt/d$i; dd if=/dev/zero of=/mnt/d$i/f
bs=64k count=4; done

6.1.191 oopses within the first few mkdir calls, with or without the
resize. 6.1.190 completes the same test both ways. Without memory
pressure it doesn't reproduce here.

Locally we work around it by turning a NULL return into ERR_PTR(-ENOENT),
or ERR_PTR(-ENOMEM) with FGP_CREAT, at the six __filemap_get_folio()
calls in mballoc.c; with that, 6.1.191 passes the test. I can send that
patch if it helps, but you may prefer to fix the backport itself.

#regzbot introduced: v6.1.190..v6.1.191

Thanks,
Simone Colombo
