Received: from mx.manguebit.com (mx.manguebit.com [167.235.159.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A76E9FC1F
	for <regressions@lists.linux.dev>; Wed, 17 Apr 2024 22:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=167.235.159.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713394743; cv=pass; b=Hr/do+LGsms46N+ljeZlzvr9wakmcobCGv0+SzPvGU8obfs6H399hkIJr1GmiKRhnsH9t3vvQNzVCBwzxd/Te9Xadn4vMUOLM8zD8HCdtKRCQYwXwv66Nt2z5YE6Y5+rUxdfkY+7kb1Lhe078rErPHoYhB/QwXjb/7H/4Vi4j1s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713394743; c=relaxed/simple;
	bh=IN21uIJFZDZ6vnpfnCKHO19bcht2OmcqLTfLjQSZuP0=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Date:
	 MIME-Version:Content-Type; b=HxAsBnlNvgy147FtdDl0gUApA7Tu0u+wLOeSXk3mKx4JFFm9/BI5I8Nj8gE3SCwGhzWkUvmnl9POfzbZucg2dbiYDtySCjf9dQFCIgcazs25zGnn4Z/y1NjiByd/LsVscwQpuOMYhdRzZ/iz9kD/Qr+gaEV9JsaaEQZnwkijBR4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manguebit.com; spf=pass smtp.mailfrom=manguebit.com; dkim=pass (2048-bit key) header.d=manguebit.com header.i=@manguebit.com header.b=ocCvKi8g; arc=pass smtp.client-ip=167.235.159.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manguebit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=manguebit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=manguebit.com header.i=@manguebit.com header.b="ocCvKi8g"
Message-ID: <cc3eea56282f4b43d0fe151a9390c512@manguebit.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manguebit.com;
	s=dkim; t=1713394739;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5gX4h7XWwTPzc8qUo6w0KwuwczujKTtmoHLee/tMjAQ=;
	b=ocCvKi8gbZu5b4BREy1H6sWfoG/AFUCtTKXPougAtf+fSZKz8anHGr8T20VF2b7lT3Q6BW
	KdWT6eLMAHAXKIYKik2Dj3kZC3zDlcINdvrT8xRIyXViTjnO+dmgkxbwaO+/naHaUCjH77
	WmQytU2knAl/fm3bndxlr+lh/QdmaPpZjX9l6Wp71TkLffJ3ogxPWsEOAp+zsoz7QwNGij
	qRIc3hSzvA8tkRfTly2CdqFVwFKDxmYBODakzItrKewFa50yCZdhlxoQIQ/aAp29vcJh8+
	a4ayEhzqk4kqKth1pEoSEc28qxXeUDeauTuMPgifAPLzYzKus5qylBnYGUX8XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=manguebit.com;
	s=dkim; t=1713394739; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5gX4h7XWwTPzc8qUo6w0KwuwczujKTtmoHLee/tMjAQ=;
	b=MbfVg54eCphZ65LWZXZc3HM7Dk4cm57ZB2fVm4C+5t70bW5pg7/+1cI4xRu7VB+ZP7TrqZ
	gVaMU5WVvCgKMTdNfIQE1IehAqPekjLNVAE9jaIYGLLEDXSP7Z+dwbT8+wuEq7xjaQUAug
	Q3a1hol5GHjQkRTyAr0OcKPg7FTx+Xvv+gkbBNQW9QiVkLinH1eK6uRXJzCtrgrEqDz1K0
	m2Tes9YHA6myhAQIJFp0siM1frNOBonzJKHhU6wgHlt/Nq1LXalrk2obUM0ihdGlrmg8lN
	jNxdd+qq3cy7mi78QkGT9pFsQo5WpjRdTPjDc3fW1dmD29ay3513+skBmEkoAg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.mailfrom=pc@manguebit.com
ARC-Seal: i=1; s=dkim; d=manguebit.com; t=1713394739; a=rsa-sha256;
	cv=none;
	b=Q3PxL6tMjkIFg/uKKBiBjvpa/2ccv6jRZmfQMD40seMtX0zKXDtv8p2DbMyudC/ZL4D6u3
	gcu3HFBur0ceETPWWeFegixMyZxyPDcHGZd3QTp9SgYVdCa8WvbQ4cSC9CQnhyy0fl7t2J
	/zjLsg4tCVkDXeqnZAtmpdIPgyMhI1EyixH41byHrmF1PBBCu9YVYkXd9uq03iINT2lRwN
	PohZU/epCV83ik0RQnZNNJ+v5nwtTq0Z4lwWBiOxkReGTsAP8Wedxa1NgUImaXsTjDGCa7
	kj/OCLVgM9uUqROUM5yR5djBBkvSxd5SiAxbYEX//V0GprXg7lBhpqaegQihdw==
From: Paulo Alcantara <pc@manguebit.com>
To: Salvatore Bonaccorso <carnil@debian.org>, regressions@lists.linux.dev,
 Steve French <stfrench@microsoft.com>
Cc: gregkh@linuxfoundation.org, sashal@kernel.org, stable@vger.kernel.org,
 linux-cifs@vger.kernel.org
Subject: Re: [regression 6.1.80+] "CIFS: VFS: directory entry name would
 overflow frame end of buf" and invisible files under certain conditions
 and at least with noserverino mount option
In-Reply-To: <ZiBCsoc0yf_I8In8@eldamar.lan>
References: <ZiBCsoc0yf_I8In8@eldamar.lan>
Date: Wed, 17 Apr 2024 19:58:56 -0300
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Hi Salvatore,

Salvatore Bonaccorso <carnil@debian.org> writes:

> In Debian we got two reports of cifs mounts not functioning, hiding
> certain files. The two reports are:
>
> https://bugs.debian.org/1069102
> https://bugs.debian.org/1069092
>
> On those cases kernel logs error
>
> [   23.225952] CIFS: VFS: directory entry name would overflow frame end of buf 00000000a44b272c

I couldn't reproduce it.  Does the following fix your issue:

diff --git a/fs/smb/client/smb2pdu.c b/fs/smb/client/smb2pdu.c
index 4c1231496a72..3ee35430595e 100644
--- a/fs/smb/client/smb2pdu.c
+++ b/fs/smb/client/smb2pdu.c
@@ -5083,7 +5083,7 @@ smb2_parse_query_directory(struct cifs_tcon *tcon,
 		info_buf_size = sizeof(struct smb2_posix_info);
 		break;
 	case SMB_FIND_FILE_FULL_DIRECTORY_INFO:
-		info_buf_size = sizeof(FILE_FULL_DIRECTORY_INFO);
+		info_buf_size = sizeof(FILE_FULL_DIRECTORY_INFO) - 1;
 		break;
 	default:
 		cifs_tcon_dbg(VFS, "info level %u isn't supported\n",

If not, please provide network trace and verbose logs.

Thanks.
