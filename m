Received: from sender4-pp-o94.zoho.com (sender4-pp-o94.zoho.com [136.143.188.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC7678F4A
	for <regressions@lists.linux.dev>; Tue,  1 Jul 2025 01:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751333916; cv=pass; b=a4flMaVHsmbrCOQtnFSSQYR1IVNjWazYvmOVDHeFU6+z6jFPqDFUNNZArWZ/RsgQTYqwPdWnbPAKP/U1GIa1Gk3/xfX2wcUcgZBOk0qjlgvcX1U10jWkNbzekt8ZCqx4GuuweQQKWfUR7WbqXJw1UQDBp8zO6E1wO8y3GOJzuIQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751333916; c=relaxed/simple;
	bh=v7FNCa21DJnvR2zTC15KT2oxyMh+OB7pBTrd7B7KZms=;
	h=Date:From:To:Message-ID:In-Reply-To:Subject:MIME-Version:
	 Content-Type; b=TFkEZCduhnRSMbyYJd25ypzJp0I4fzN6dC2UykOvVRzmaKhr7MFQ0hjjbPnl670TH9YCa0ef3Ae6h76EiwC/1to6aa9OG6iFnQ/NlMMxQQpJRE15WZwbLHQWXFOT497OaAomkeJg4vor2hBFNXk1DdGCdzkr76t0d13MOFl25t8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com; spf=pass smtp.mailfrom=zohomail.com; dkim=pass (1024-bit key) header.d=zohomail.com header.i=safinaskar@zohomail.com header.b=AQ0e2Csh; arc=pass smtp.client-ip=136.143.188.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.com header.i=safinaskar@zohomail.com header.b="AQ0e2Csh"
ARC-Seal: i=1; a=rsa-sha256; t=1751333913; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=VF2gh3MVI41rkUnDja/l4DLRXI8X5QtmNq75Rro97c8+xFY4adbRKOpm2wmeK5xohkwkut3N7cvhdNHHSrui2CyOth1sfhb7lzPFkwME/dEotWGUY6vbenUFc4fYyinnlaAJw3M0DPwmH/0xScLdsCZJfF32QzQQQbXXzNTVSCs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1751333913; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=v7FNCa21DJnvR2zTC15KT2oxyMh+OB7pBTrd7B7KZms=; 
	b=b7omv21wuQ3L+NnwqNzVC9dyV0OROTMYyMrA0G/XzHqyWqmWkEtw/151anhK678/N/+k1GPqJ6rMG0tio5oki9ngGQ/kY7HMv2lngzvfZbgzNGms5gMeccyA2rmqi530sTcsfJygY22t/0L0YnGGW1RIg897YLuojzkrQHqD/Hs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=safinaskar@zohomail.com;
	dmarc=pass header.from=<safinaskar@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751333913;
	s=zm2022; d=zohomail.com; i=safinaskar@zohomail.com;
	h=Date:Date:From:From:To:To:Message-ID:In-Reply-To:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To:Cc;
	bh=v7FNCa21DJnvR2zTC15KT2oxyMh+OB7pBTrd7B7KZms=;
	b=AQ0e2CshNN3QWDrgqyZVddZfnyVQwVjtQVHohLV1XbXQ6XzLDefBWlsJ2ogVwKdU
	7K1aT301+rhFEvFL2asH1vWTx3poMItT7DMlEKejBmd52zDOl0JhSMmmPQ8N8yHM1c8
	lW6tp7iFSuY+OSyRQLqN22rG86PWi1/+E1glUW+Y=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1751333911886418.7483786627944; Mon, 30 Jun 2025 18:38:31 -0700 (PDT)
Received: from  [212.73.77.104] by mail.zoho.com
	with HTTP;Mon, 30 Jun 2025 18:38:31 -0700 (PDT)
Date: Tue, 01 Jul 2025 05:38:31 +0400
From: Askar Safin <safinaskar@zohomail.com>
To: "Linux Regressions" <regressions@lists.linux.dev>,
	"Thorsten Leemhuis" <linux@leemhuis.info>
Message-ID: <197c3a2bd41.128a00dd4617828.8338848291703569280@zohomail.com>
In-Reply-To: 
Subject: regzbot dashboard stalled (last update: 2025-04-14 11:39:48 (UTC))
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
Feedback-ID: rr080112275f87a45b75b0c9ad371ccc8d0000d07329bef4f945c8a862f557879d774873cb52d094e3e4e5e7:zu080112277644b9b31b9bbfa8fadb4ff2000025a66e16027baa865fea6d61af207146a4214e9ce66fed5906:rf0801122cc6b9881e1263cf846cb7725600000074e490cd98db35b4e90dcff0adddc06e74878f2dc689fa71eac2005a0a:ZohoMail

regzbot dashboard stalled.
https://linux-regtracking.leemhuis.info/regzbot/mainline/ shows: "compiled by regzbot on 2025-04-14 11:39:48 (UTC)"


--
Askar Safin
https://types.pl/@safinaskar

