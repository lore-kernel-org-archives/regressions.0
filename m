Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500EF1891A9
	for <regressions@lists.linux.dev>; Sun, 31 May 2026 01:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780189936; cv=pass; b=luhMfHh5jOIZsQVF8iqM30d3S7uipSzKz0vvlN9R98TT6utV4ODdSlDQP9Ov/m5bY1xal99xJflyuALRlhC/zV9Ip1XHp4UlfE8kJrrP6vhGQcwviET4/1D+GcmpGz93p7sXvU9X5vuRS0cJjFnaBld58CKdFkVvbtLoBv99HGc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780189936; c=relaxed/simple;
	bh=W62O6qbs3ZKG8xO/+DyqjzyW9/JwB0GbWGE/e3oqbR8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=owcU1dtbmJgCKF/kbDUPAzGYjX+NrNjr4KtcvdUCBDbwucfZQyfLJ7SMgpQcHCvUnuo1LtHCEzdyP9lRPD4HqNeRI2+XJjLe1megbyT8nlbB+VYNKgbFHGPjrbbIpBjK5DaoprAZelQdP47gAlo+SCLWhI7c6vcwEz0tF2dCpp4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gDYPE8sL; arc=pass smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gDYPE8sL"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2c0c2d8b95bso1539135ad.1
        for <regressions@lists.linux.dev>; Sat, 30 May 2026 18:12:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780189934; cv=none;
        d=google.com; s=arc-20240605;
        b=GVRhwycr513mL1kQhsTSCV2nNQp+jEVXJUBDoaaVNMj5LoCliXqkwoJLIhG6COpSDB
         KIq4aCdEMzVBRHc+4hhmDnZsx+YSP86g76Q/4XeYdLuIKv1Fkif1mZJwAhQuyvP1hd+G
         5MrUstAZKDmNC/WObN/iBUsj6n13zYBhwR0a41hzFLRiDvOZwGyIItQNPz5rVsY3pADf
         eejJ2XM9+BenggCasXyYm7Mu0Re3rIByrxU3xr6z6ZJ8gkwDpAtgwJhh22vP8/Ji3Zbb
         qZtq7pZ4V0fUFfD9LYyBHQI8qpqnrYzZsQNkZw/Ycv8J8ni0lNhNDB/BADcIk4Hv8N6R
         IkqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=K3IRqDu/cs1dVQ1QO9A0E2Hsj/Zj/URAXOHivWFZLc0=;
        fh=oEVF74hMrHu4kc7LKFX+a0cTvK7oVX3kD/dbqGpa4iU=;
        b=UoDTh7EPnR6lrJlewtqAm/+5FXS1V8bN2o3Lns6HHRiBtk2LoQU5DemsqZIbEjgnSF
         QDVr7HwJZj3Whx+pOeqtQn7ZL1t4EGLMnVjL0LqJUG1QmSldQruaCXTSTcwp6t7v4kS7
         N77sjnAXPff7jCkIJYlwiwsivk4yxdeN98oTOws3j2VhEBs5FCkM0Fp5G7+5iSd+Su0K
         oiNtI70bl7XHJUxKm0wMDcbEJU1bO3gLVw4EDnA2b/YkaxI1aUIKRgG/zDMYIBSTs6C1
         /iWo2LEJarxIClTxXrwz98jmJurtsmADcO53RfwbxB+U3+1t6XXfRNHGE5IMuBIWyvfb
         SkyA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780189934; x=1780794734; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=K3IRqDu/cs1dVQ1QO9A0E2Hsj/Zj/URAXOHivWFZLc0=;
        b=gDYPE8sL7aEfVzHeaIN04RMX96gtSGeynhnG1xt3GeruFFX/9XUsNaQf/kQt99xjt5
         0GC6LhpuUMfJjupzLuEJEC+9X9rs0Sbt015stcITNuMyez/982h/Y5rZo/nfwVYaSUhG
         +4Gp5HSfoAXT8bS6B4yXYPjqnUsqMcpBjZHlbpLRiXG4DIyUsgoy892wpMxY4kk2ViyR
         hnwcT2JrdF7VFFtGLxSx5Ya2lbnkVFNCg5QeeeganoCc2RDJgG35A56RpqUZE/3EnM5R
         rA8ZqKhi/wVNynWSh+yJLOkIrrTsUqyNhHQwWoAcZYYTJO6HcuHKtV37pYO8h04/J8mi
         o92A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780189934; x=1780794734;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K3IRqDu/cs1dVQ1QO9A0E2Hsj/Zj/URAXOHivWFZLc0=;
        b=WSbRJ4js0pUBqjFVyMBd0uyJaAD1wALj6824mZriTxC8wZF0sETFafY4yKGFywGZjM
         1KoNawXcClWqkp8lc24X4hYdHFpQzrSt23tSvTVsW/RdVEXiEvKyZHHBHeuzQHgkQvdR
         E9JBXAXccdugo2E0naSWaEIvDbLssCA8yCIJcHI/pmoq3vB9/mtZ3rc9Gph85EqziLxr
         IRIMrYCwvIs6OulhD+7WMGpAi77K3P0S0lPVfUDgymYIB2F8+ZYEyhGAI1NpcKOmDB5t
         pw8STMpyKCz+BRse49Fk88V4pmk/eVeJ0Erf0iZPT1NXSwd1xM9ZK2youmlkCyvJMojG
         B4kA==
X-Forwarded-Encrypted: i=1; AFNElJ9V+ZJhBaltph+YUx2EWPg2gqXQY+P4BrZHR+alZJuPjK0tUPN+EfqHMEVUxwUcOXXYqgCHy1ntyN6d5Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YyzAqYlS4CmYa/Fg3sox6r/Z7MxoF9joXO7yMR+KEMG1osqIVLO
	cAl2f/fHwqa/jkrtoJaQxejEfyH51H9uN8E39p0s1psU9UwlBDHT48dw9o3KbxUOQ3A0TdfyjlM
	5jPgD0dHfzympweq6fb//dXu6qMi+3sk=
X-Gm-Gg: Acq92OGxM9hJO8I2DKdNwv5a3aLA+mcFNHcqqxw0vY1gmqD2+Gf9My4Zx7ft6xr7aZ9
	eEhHn90Gm1BQA7gzcOdgV2gZvFbyxrPgFSLWKjc/T29yXk1C4hys2Bgxgx+Et+qFFLUGjhECczX
	0AQ/ot7fGs2mcIe6+bNuvLEyZPA1m3pQsTE2JnUbddgEo3q4S1dpJLJ1eUs43wVPKHK7du/ClSW
	6kKpjzgXJ72qwHPVPePRHjr3RncuskjsUu9psEMNoO0yOg+Z8laq6e1S8vV4F9MyMVZwnh2qL/y
	WUwKZQHWTKgDOPcSz9qlxUWWwWzzZLlFDqOyXhDd
X-Received: by 2002:a05:6a20:b08d:b0:3b1:8cf6:8f60 with SMTP id
 adf61e73a8af0-3b427f98183mr5887392637.12.1780189934435; Sat, 30 May 2026
 18:12:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: =?UTF-8?B?0JDRgNGC0LXQvCDQm9Cw0LHQsNC30L7Qsg==?= <123321artyom@gmail.com>
Date: Sun, 31 May 2026 04:12:02 +0300
X-Gm-Features: AVHnY4KPEsdbKWeLNEnbmsMt_76NTAfc3Op-S-TznsaFqupDsP0IQ7F42VIWElY
Message-ID: <CAFbF8N7++zopZuEcsKRxBV_sgOGCbzCY0hOyMw1SiGAtuzGhyQ@mail.gmail.com>
Subject: PROBLEM: FUSE_NOTIFY_INVAL_ENTRY leaves stale negative dentry after c9ba789dad15
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: multipart/mixed; boundary="000000000000acdc2d065312c4c3"

--000000000000acdc2d065312c4c3
Content-Type: text/plain; charset="UTF-8"

Hi,

I am reporting a FUSE/VFS regression introduced by:

  c9ba789dad15ba65662bba17595c0aeaa0cfcf1c
  VFS: introduce start_creating_noperm() and start_removing_noperm()

After a FUSE filesystem returns a cached negative lookup for a name, then
later makes that name visible and sends FUSE_NOTIFY_INVAL_ENTRY for it,
readdir() can list the entry while stat()/open() on the same path still
returns ENOENT.

Bisect result:

  good: v6.17
  bad:  v6.19

  first bad commit:
    c9ba789dad15ba65662bba17595c0aeaa0cfcf1c
    VFS: introduce start_creating_noperm() and start_removing_noperm()

Adjacent commits:

  bd6ede8a06e89ca5a94a8b51cea792705d1b8ca2 GOOD
  c9ba789dad15ba65662bba17595c0aeaa0cfcf1c BAD

The bad commit changes fs/fuse/dir.c:fuse_reverse_inval_entry() to use
start_removing_noperm().

I attached a minimal libfuse3 reproducer. It does:

  1. lookup("config") returns ino=0 with non-zero entry_timeout, causing
     the kernel to cache a negative dentry.
  2. The filesystem makes "config" visible.
  3. It calls fuse_lowlevel_notify_inval_entry(root, "config").
  4. The test checks whether readdir lists "config" and stat("config")
     succeeds.

Build:

  cc -O2 -Wall -Wextra repro.c -o repro $(pkg-config --cflags --libs
fuse3) -lpthread

Run:

  mkdir -p mnt
  ./repro ./mnt

Observed results:

  Linux 6.17.0:
    notify_inval_entry rc=0
    listed=1 stat=OK
    GOOD
    exit code 0

  Linux 6.19.0:
    notify_inval_entry rc=-2
    listed=1 stat=No such file or directory
    BAD
    exit code 1

  Linux 7.1.0-rc5-00426-g670b77dfebe7:
    notify_inval_entry rc=-2
    listed=1 stat=No such file or directory
    BAD
    exit code 1

#regzbot introduced: c9ba789dad15ba65662bba17595c0aeaa0cfcf1c

Assisted-by: OpenCode:openai/gpt-5.5

Thanks,
Artem

--000000000000acdc2d065312c4c3
Content-Type: application/octet-stream; name="repro.c"
Content-Disposition: attachment; filename="repro.c"
Content-Transfer-Encoding: base64
Content-ID: <f_mpt333dj0>
X-Attachment-Id: f_mpt333dj0

Ly8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKLy8gUmVwcm9kdWNlciBmb3IgYzli
YTc4OWRhZDE1OiBjYWNoZWQgbmVnYXRpdmUgRlVTRSBkZW50cnkgc3Vydml2ZXMKLy8gRlVTRV9O
T1RJRllfSU5WQUxfRU5UUlkuICBFeGl0OiAwPWdvb2QsIDE9YmFkLCAyPWVycm9yLgovLyBCdWls
ZDogY2MgLU8yIC1XYWxsIC1XZXh0cmEgcmVwcm8uYyAtbyByZXBybyAkKHBrZy1jb25maWcgLS1j
ZmxhZ3MgLS1saWJzIGZ1c2UzKSAtbHB0aHJlYWQKI2RlZmluZSBGVVNFX1VTRV9WRVJTSU9OIDM0
CiNpbmNsdWRlIDxkaXJlbnQuaD4KI2luY2x1ZGUgPGVycm5vLmg+CiNpbmNsdWRlIDxmdXNlX2xv
d2xldmVsLmg+CiNpbmNsdWRlIDxwdGhyZWFkLmg+CiNpbmNsdWRlIDxzdGRpby5oPgojaW5jbHVk
ZSA8c3RkbGliLmg+CiNpbmNsdWRlIDxzdHJpbmcuaD4KI2luY2x1ZGUgPHN5cy9zdGF0Lmg+CiNp
bmNsdWRlIDx1bmlzdGQuaD4KCmVudW0geyBST09UID0gMSwgQ09ORklHID0gMiB9OwpzdGF0aWMg
c3RydWN0IGZ1c2Vfc2Vzc2lvbiAqc2U7CnN0YXRpYyB2b2xhdGlsZSBpbnQgdmlzaWJsZTsKCnN0
YXRpYyB2b2lkIGF0dHIoc3RydWN0IHN0YXQgKnN0LCBmdXNlX2lub190IGlubykKewogIG1lbXNl
dChzdCwgMCwgc2l6ZW9mKCpzdCkpOwogIHN0LT5zdF9pbm8gPSBpbm87CiAgc3QtPnN0X21vZGUg
PSBTX0lGRElSIHwgMDc1NTsKICBzdC0+c3RfbmxpbmsgPSAyOwogIHN0LT5zdF91aWQgPSBnZXR1
aWQoKTsKICBzdC0+c3RfZ2lkID0gZ2V0Z2lkKCk7Cn0KCnN0YXRpYyB2b2lkIGVudHJ5KGZ1c2Vf
cmVxX3QgcmVxLCBmdXNlX2lub190IGlubywgZG91YmxlIHQpCnsKICBzdHJ1Y3QgZnVzZV9lbnRy
eV9wYXJhbSBlID0gey5pbm8gPSBpbm8sIC5nZW5lcmF0aW9uID0gMSwgLmVudHJ5X3RpbWVvdXQg
PSB0LAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLmF0dHJfdGltZW91dCA9IHR9Owog
IGlmIChpbm8pCiAgICBhdHRyKCZlLmF0dHIsIGlubyk7CiAgZnVzZV9yZXBseV9lbnRyeShyZXEs
ICZlKTsKfQoKc3RhdGljIHZvaWQgbG9va3VwKGZ1c2VfcmVxX3QgcmVxLCBmdXNlX2lub190IHBh
cmVudCwgY29uc3QgY2hhciAqbmFtZSkKewogIGlmIChwYXJlbnQgIT0gUk9PVCkgewogICAgZnVz
ZV9yZXBseV9lcnIocmVxLCBFTk9FTlQpOwogICAgcmV0dXJuOwogIH0KICBpZiAoIXN0cmNtcChu
YW1lLCAiY29uZmlnIikpCiAgICByZXR1cm4gZW50cnkocmVxLCB2aXNpYmxlID8gQ09ORklHIDog
MCwgNjAwLjApOwogIGZ1c2VfcmVwbHlfZXJyKHJlcSwgRU5PRU5UKTsKfQoKc3RhdGljIHZvaWQg
Z2V0YXR0cihmdXNlX3JlcV90IHJlcSwgZnVzZV9pbm9fdCBpbm8sIHN0cnVjdCBmdXNlX2ZpbGVf
aW5mbyAqZmkpCnsKICAodm9pZClmaTsKICBpZiAoaW5vID09IFJPT1QgfHwgaW5vID09IENPTkZJ
RykgewogICAgc3RydWN0IHN0YXQgc3Q7CiAgICBhdHRyKCZzdCwgaW5vKTsKICAgIGZ1c2VfcmVw
bHlfYXR0cihyZXEsICZzdCwgNjAwLjApOwogICAgcmV0dXJuOwogIH0KICBmdXNlX3JlcGx5X2Vy
cihyZXEsIEVOT0VOVCk7Cn0KCnN0YXRpYyB2b2lkIGFkZChmdXNlX3JlcV90IHJlcSwgY2hhciAq
KnAsIHNpemVfdCAqc3osIGNvbnN0IGNoYXIgKm5hbWUsCiAgICAgICAgICAgICAgICBmdXNlX2lu
b190IGlubykKewogIHN0cnVjdCBzdGF0IHN0OwogIGF0dHIoJnN0LCBpbm8pOwogIHNpemVfdCBv
bGQgPSAqc3o7CiAgKnN6ICs9IGZ1c2VfYWRkX2RpcmVudHJ5KHJlcSwgTlVMTCwgMCwgbmFtZSwg
TlVMTCwgMCk7CiAgKnAgPSByZWFsbG9jKCpwLCAqc3opOwogIGZ1c2VfYWRkX2RpcmVudHJ5KHJl
cSwgKnAgKyBvbGQsICpzeiAtIG9sZCwgbmFtZSwgJnN0LCAqc3opOwp9CgpzdGF0aWMgdm9pZCBy
ZWFkZGlyX2NiKGZ1c2VfcmVxX3QgcmVxLCBmdXNlX2lub190IGlubywgc2l6ZV90IHNpemUsIG9m
Zl90IG9mZiwKICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZnVzZV9maWxlX2luZm8gKmZp
KQp7CiAgKHZvaWQpZmk7CiAgaWYgKGlubyAhPSBST09UKSB7CiAgICBmdXNlX3JlcGx5X2Vycihy
ZXEsIEVOT1RESVIpOwogICAgcmV0dXJuOwogIH0KICBjaGFyICpidWYgPSBOVUxMOwogIHNpemVf
dCBzeiA9IDA7CiAgYWRkKHJlcSwgJmJ1ZiwgJnN6LCAiLiIsIFJPT1QpOwogIGFkZChyZXEsICZi
dWYsICZzeiwgIi4uIiwgUk9PVCk7CiAgaWYgKHZpc2libGUpCiAgICBhZGQocmVxLCAmYnVmLCAm
c3osICJjb25maWciLCBDT05GSUcpOwogIGlmIChvZmYgPCAob2ZmX3Qpc3opCiAgICBmdXNlX3Jl
cGx5X2J1ZihyZXEsIGJ1ZiArIG9mZiwgc3ogLSBvZmYgPCBzaXplID8gc3ogLSBvZmYgOiBzaXpl
KTsKICBlbHNlCiAgICBmdXNlX3JlcGx5X2J1ZihyZXEsIE5VTEwsIDApOwogIGZyZWUoYnVmKTsK
fQoKc3RhdGljIHZvaWQgb3BlbmRpcl9jYihmdXNlX3JlcV90IHJlcSwgZnVzZV9pbm9fdCBpbm8s
CiAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGZ1c2VfZmlsZV9pbmZvICpmaSkKewogIGlu
byA9PSBST09UID8gZnVzZV9yZXBseV9vcGVuKHJlcSwgZmkpIDogZnVzZV9yZXBseV9lcnIocmVx
LCBFTk9URElSKTsKfQoKc3RhdGljIGNvbnN0IHN0cnVjdCBmdXNlX2xvd2xldmVsX29wcyBvcHMg
PSB7CiAgICAubG9va3VwID0gbG9va3VwLAogICAgLmdldGF0dHIgPSBnZXRhdHRyLAogICAgLm9w
ZW5kaXIgPSBvcGVuZGlyX2NiLAogICAgLnJlYWRkaXIgPSByZWFkZGlyX2NiLAp9OwoKc3RhdGlj
IHZvaWQgKmxvb3Aodm9pZCAqYXJnKSB7CiAgZnVzZV9zZXNzaW9uX2xvb3AoYXJnKTsKICByZXR1
cm4gTlVMTDsKfQoKc3RhdGljIGludCBsaXN0ZWQoY29uc3QgY2hhciAqbW50KQp7CiAgRElSICpk
ID0gb3BlbmRpcihtbnQpOwogIGlmICghZCkKICAgIHJldHVybiAwOwogIGludCBzZWVuID0gMDsK
ICBzdHJ1Y3QgZGlyZW50ICpkZTsKICB3aGlsZSAoKGRlID0gcmVhZGRpcihkKSkpCiAgICBzZWVu
IHw9ICFzdHJjbXAoZGUtPmRfbmFtZSwgImNvbmZpZyIpOwogIGNsb3NlZGlyKGQpOwogIHJldHVy
biBzZWVuOwp9CgpzdGF0aWMgaW50IHVzZXIoY29uc3QgY2hhciAqbW50KQp7CiAgY2hhciBjWzQw
OTZdOwogIHN0cnVjdCBzdGF0IHN0OwogIHNucHJpbnRmKGMsIHNpemVvZihjKSwgIiVzL2NvbmZp
ZyIsIG1udCk7CiAgaWYgKHN0YXQoYywgJnN0KSA9PSAwIHx8IGVycm5vICE9IEVOT0VOVCkKICAg
IHJldHVybiBmcHJpbnRmKHN0ZGVyciwgImV4cGVjdGVkIGluaXRpYWwgRU5PRU5UXG4iKSwgMjsK
ICBpZiAobGlzdGVkKG1udCkpCiAgICByZXR1cm4gZnByaW50ZihzdGRlcnIsICJjb25maWcgbGlz
dGVkIHRvbyBlYXJseVxuIiksIDI7CiAgdmlzaWJsZSA9IDE7CiAgaW50IHJjID0KICAgICAgZnVz
ZV9sb3dsZXZlbF9ub3RpZnlfaW52YWxfZW50cnkoc2UsIFJPT1QsICJjb25maWciLCBzdHJsZW4o
ImNvbmZpZyIpKTsKICBmcHJpbnRmKHN0ZGVyciwgIm5vdGlmeV9pbnZhbF9lbnRyeSByYz0lZFxu
IiwgcmMpOwogIHVzbGVlcCgxMDAwMDApOyAvLyBsZXQgbm90aWZ5IHJlYWNoIHRoZSBrZXJuZWwK
ICBlcnJubyA9IDA7CiAgaW50IHNlZW4gPSBsaXN0ZWQobW50KSwgb2sgPSAhc3RhdChjLCAmc3Qp
LCBlcnIgPSBlcnJubzsKICBmcHJpbnRmKHN0ZGVyciwgImxpc3RlZD0lZCBzdGF0PSVzXG4iLCBz
ZWVuLCBvayA/ICJPSyIgOiBzdHJlcnJvcihlcnIpKTsKICBpZiAoc2VlbiAmJiAhb2sgJiYgZXJy
ID09IEVOT0VOVCkKICAgIHJldHVybiBwdXRzKCJCQUQiKSwgMTsKICByZXR1cm4gcHV0cygiR09P
RCIpLCAwOwp9CgppbnQgbWFpbihpbnQgYXJnYywgY2hhciAqKmFyZ3YpCnsKICBpZiAoYXJnYyAh
PSAyKQogICAgcmV0dXJuIGZwcmludGYoc3RkZXJyLCAidXNhZ2U6ICVzIDxtb3VudHBvaW50Plxu
IiwgYXJndlswXSksIDI7CiAgc3RydWN0IGZ1c2VfYXJncyBhcmdzID0gRlVTRV9BUkdTX0lOSVQo
MCwgTlVMTCk7CiAgZnVzZV9vcHRfYWRkX2FyZygmYXJncywgYXJndlswXSk7CiAgZnVzZV9vcHRf
YWRkX2FyZygmYXJncywgIi1vIik7CiAgZnVzZV9vcHRfYWRkX2FyZygmYXJncywgImF1dG9fdW5t
b3VudCxmc25hbWU9aW52YWxyZXBybyIpOwogIHNlID0gZnVzZV9zZXNzaW9uX25ldygmYXJncywg
Jm9wcywgc2l6ZW9mKG9wcyksIE5VTEwpOwogIGlmICghc2UgfHwgZnVzZV9zZXNzaW9uX21vdW50
KHNlLCBhcmd2WzFdKSkKICAgIHJldHVybiBwZXJyb3IoImZ1c2UgbW91bnQiKSwgMjsKICBwdGhy
ZWFkX3QgbHQ7CiAgcHRocmVhZF9jcmVhdGUoJmx0LCBOVUxMLCBsb29wLCBzZSk7CiAgaW50IHJl
dCA9IHVzZXIoYXJndlsxXSk7CiAgZnVzZV9zZXNzaW9uX2V4aXQoc2UpOwogIGZ1c2Vfc2Vzc2lv
bl91bm1vdW50KHNlKTsKICBwdGhyZWFkX2NhbmNlbChsdCk7CiAgcHRocmVhZF9qb2luKGx0LCBO
VUxMKTsKICBmdXNlX3Nlc3Npb25fZGVzdHJveShzZSk7CiAgcmV0dXJuIHJldDsKfQo=
--000000000000acdc2d065312c4c3--
